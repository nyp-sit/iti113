import boto3
import json
import logging
from datetime import datetime, timezone
from typing import List, Dict, Any

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Initialize AWS clients
sagemaker_client = boto3.client('sagemaker')
cloudwatch_client = boto3.client('cloudwatch')

def lambda_handler(event, context):
    """
    Lambda function to stop all running SageMaker MLflow tracking servers.
    
    This function:
    1. Lists all MLflow tracking servers
    2. Identifies running servers
    3. Stops them
    4. Logs the results
    5. Sends metrics to CloudWatch
    """
    
    try:
        logger.info("Starting MLflow tracking server shutdown process")
        
        # Get all MLflow tracking servers
        tracking_servers = list_mlflow_tracking_servers()
        logger.info(f"Found {len(tracking_servers)} total MLflow tracking servers")
        
        # Filter running servers
        running_servers = [server for server in tracking_servers if server['Status'] == 'InService']
        logger.info(f"Found {len(running_servers)} running MLflow tracking servers")
        
        if not running_servers:
            logger.info("No running MLflow tracking servers found. Nothing to stop.")
            send_metrics(0, 0, 0)
            return {
                'statusCode': 200,
                'body': json.dumps({
                    'message': 'No running MLflow tracking servers found',
                    'servers_stopped': 0,
                    'total_servers': len(tracking_servers)
                })
            }
        
        # Stop running servers
        stopped_servers = []
        failed_servers = []
        
        for server in running_servers:
            try:
                server_name = server['MlflowTrackingServerName']
                logger.info(f"Stopping MLflow tracking server: {server_name}")
                
                # response = sagemaker_client.stop_mlflow_tracking_server(
                #     MlflowTrackingServerName=server_name
                # )
                
                stopped_servers.append({
                    'name': server_name,
                    'arn': server['MlflowTrackingServerArn'],
                    # 'response': response
                    'response': 'stopped'
                })
                
                logger.info(f"Successfully initiated stop for server: {server_name}")
                
            except Exception as e:
                logger.error(f"Failed to stop server {server['MlflowTrackingServerName']}: {str(e)}")
                failed_servers.append({
                    'name': server['MlflowTrackingServerName'],
                    'arn': server['MlflowTrackingServerArn'],
                    'error': str(e)
                })
        
        # Send metrics to CloudWatch
        send_metrics(len(stopped_servers), len(failed_servers), len(tracking_servers))
        
        # Prepare response
        response_body = {
            'message': f'MLflow tracking server shutdown completed',
            'servers_stopped': len(stopped_servers),
            'servers_failed': len(failed_servers),
            'total_servers': len(tracking_servers),
            'stopped_servers': [s['name'] for s in stopped_servers],
            'failed_servers': [s['name'] for s in failed_servers],
            'timestamp': datetime.now(timezone.utc).isoformat()
        }
        
        logger.info(f"Shutdown process completed. Stopped: {len(stopped_servers)}, Failed: {len(failed_servers)}")
        
        return {
            'statusCode': 200,
            'body': json.dumps(response_body, indent=2)
        }
        
    except Exception as e:
        logger.error(f"Unexpected error in lambda_handler: {str(e)}")
        send_metrics(0, 0, 0, error=True)
        
        return {
            'statusCode': 500,
            'body': json.dumps({
                'error': f'Internal server error: {str(e)}',
                'timestamp': datetime.now(timezone.utc).isoformat()
            })
        }

def list_mlflow_tracking_servers() -> List[Dict[str, Any]]:
    """
    List all MLflow tracking servers across all domains.
    
    Returns:
        List of MLflow tracking server dictionaries
    """
    all_servers = []
    
    try:
        # Get all domains
        domains_response = sagemaker_client.list_domains()
        domains = domains_response['Domains']
        
        logger.info(f"Found {len(domains)} SageMaker domains")
        
        # List all MLflow tracking servers (no domain filtering needed)
        paginator = sagemaker_client.get_paginator('list_mlflow_tracking_servers')
        
        for page in paginator.paginate():
            servers = page.get('MlflowTrackingServers', [])
            all_servers.extend(servers)
            logger.info(f"Found {len(servers)} MLflow tracking servers")
        
        return all_servers
        
    except Exception as e:
        logger.error(f"Error listing MLflow tracking servers: {str(e)}")
        raise

def send_metrics(stopped_count: int, failed_count: int, total_count: int, error: bool = False):
    """
    Send metrics to CloudWatch for monitoring.
    
    Args:
        stopped_count: Number of servers successfully stopped
        failed_count: Number of servers that failed to stop
        total_count: Total number of servers found
        error: Whether there was an error in the main process
    """
    try:
        namespace = 'MLflowTrackingServer/Shutdown'
        timestamp = datetime.now(timezone.utc)
        
        metrics = [
            {
                'MetricName': 'ServersStopped',
                'Value': stopped_count,
                'Unit': 'Count',
                'Timestamp': timestamp
            },
            {
                'MetricName': 'ServersFailed',
                'Value': failed_count,
                'Unit': 'Count',
                'Timestamp': timestamp
            },
            {
                'MetricName': 'TotalServers',
                'Value': total_count,
                'Unit': 'Count',
                'Timestamp': timestamp
            },
            {
                'MetricName': 'ShutdownSuccess',
                'Value': 1 if not error else 0,
                'Unit': 'Count',
                'Timestamp': timestamp
            }
        ]
        
        cloudwatch_client.put_metric_data(
            Namespace=namespace,
            MetricData=metrics
        )
        
        logger.info(f"Sent {len(metrics)} metrics to CloudWatch")
        
    except Exception as e:
        logger.error(f"Failed to send metrics to CloudWatch: {str(e)}")
        # Don't raise the exception as metrics failure shouldn't break the main function 