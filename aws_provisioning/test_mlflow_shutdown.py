#!/usr/bin/env python3
"""
Test script for the MLflow shutdown Lambda function.
This script simulates the Lambda environment and tests the function logic.
"""

import json
import boto3
from unittest.mock import Mock, patch, MagicMock
from datetime import datetime, timezone
import sys
import os

# Add the current directory to the path so we can import the lambda function
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Import the lambda function
try:
    from lambda_stop_mlflow_servers import lambda_handler, list_mlflow_tracking_servers, send_metrics
except ImportError:
    print("Error: Could not import lambda_stop_mlflow_servers. Make sure the file exists.")
    sys.exit(1)

def create_mock_sagemaker_response():
    """Create mock SageMaker API responses for testing."""
    
    # Mock domains response
    domains_response = {
        'Domains': [
            {
                'DomainId': 'd-1234567890abcdef',
                'DomainName': 'test-domain-1',
                'Status': 'InService'
            },
            {
                'DomainId': 'd-0987654321fedcba',
                'DomainName': 'test-domain-2',
                'Status': 'InService'
            }
        ]
    }
    
    # Mock MLflow tracking servers response
    mlflow_servers_response = {
        'MlflowTrackingServers': [
            {
                'MlflowTrackingServerName': 'mlflow-server-1',
                'MlflowTrackingServerArn': 'arn:aws:sagemaker:us-east-1:123456789012:mlflow-tracking-server/mlflow-server-1',
                'Status': 'InService',
                'DomainId': 'd-1234567890abcdef'
            },
            {
                'MlflowTrackingServerName': 'mlflow-server-2',
                'MlflowTrackingServerArn': 'arn:aws:sagemaker:us-east-1:123456789012:mlflow-tracking-server/mlflow-server-2',
                'Status': 'Stopped',
                'DomainId': 'd-1234567890abcdef'
            },
            {
                'MlflowTrackingServerName': 'mlflow-server-3',
                'MlflowTrackingServerArn': 'arn:aws:sagemaker:us-east-1:123456789012:mlflow-tracking-server/mlflow-server-3',
                'Status': 'InService',
                'DomainId': 'd-0987654321fedcba'
            }
        ]
    }
    
    return domains_response, mlflow_servers_response

def test_list_mlflow_tracking_servers():
    """Test the list_mlflow_tracking_servers function."""
    print("Testing list_mlflow_tracking_servers function...")
    
    domains_response, mlflow_servers_response = create_mock_sagemaker_response()
    
    with patch('boto3.client') as mock_boto3_client:
        # Create mock SageMaker client
        mock_sagemaker_client = Mock()
        mock_boto3_client.return_value = mock_sagemaker_client
        
        # Mock the list_domains call
        mock_sagemaker_client.list_domains.return_value = domains_response
        
        # Mock the paginator for list_mlflow_tracking_servers
        mock_paginator = Mock()
        mock_sagemaker_client.get_paginator.return_value = mock_paginator
        
        # Mock the paginate method
        mock_paginator.paginate.return_value = [mlflow_servers_response]
        
        # Call the function
        result = list_mlflow_tracking_servers()
        
        # Verify the result
        assert len(result) == 3, f"Expected 3 servers, got {len(result)}"
        
        # Check that we have the expected servers
        server_names = [server['MlflowTrackingServerName'] for server in result]
        expected_names = ['mlflow-server-1', 'mlflow-server-2', 'mlflow-server-3']
        assert set(server_names) == set(expected_names), f"Expected {expected_names}, got {server_names}"
        
        print("✅ list_mlflow_tracking_servers test passed")

def test_send_metrics():
    """Test the send_metrics function."""
    print("Testing send_metrics function...")
    
    with patch('boto3.client') as mock_boto3_client:
        # Create mock CloudWatch client
        mock_cloudwatch_client = Mock()
        mock_boto3_client.return_value = mock_cloudwatch_client
        
        # Call the function
        send_metrics(2, 1, 3, False)
        
        # Verify that put_metric_data was called
        mock_cloudwatch_client.put_metric_data.assert_called_once()
        
        # Get the call arguments
        call_args = mock_cloudwatch_client.put_metric_data.call_args
        
        # Verify the namespace
        assert call_args[1]['Namespace'] == 'MLflowTrackingServer/Shutdown'
        
        # Verify the metrics
        metrics = call_args[1]['MetricData']
        assert len(metrics) == 4, f"Expected 4 metrics, got {len(metrics)}"
        
        # Check metric names
        metric_names = [metric['MetricName'] for metric in metrics]
        expected_names = ['ServersStopped', 'ServersFailed', 'TotalServers', 'ShutdownSuccess']
        assert set(metric_names) == set(expected_names), f"Expected {expected_names}, got {metric_names}"
        
        print("✅ send_metrics test passed")

def test_lambda_handler_success():
    """Test the lambda_handler function with successful execution."""
    print("Testing lambda_handler function (success case)...")
    
    domains_response, mlflow_servers_response = create_mock_sagemaker_response()
    
    with patch('boto3.client') as mock_boto3_client:
        # Create mock clients
        mock_sagemaker_client = Mock()
        mock_cloudwatch_client = Mock()
        mock_boto3_client.side_effect = [mock_sagemaker_client, mock_cloudwatch_client]
        
        # Mock the list_domains call
        mock_sagemaker_client.list_domains.return_value = domains_response
        
        # Mock the paginator for list_mlflow_tracking_servers
        mock_paginator = Mock()
        mock_sagemaker_client.get_paginator.return_value = mock_paginator
        mock_paginator.paginate.return_value = [mlflow_servers_response]
        
        # Mock the stop_mlflow_tracking_server call
        mock_sagemaker_client.stop_mlflow_tracking_server.return_value = {'ResponseMetadata': {'HTTPStatusCode': 200}}
        
        # Call the lambda handler
        event = {}
        context = Mock()
        context.function_name = 'test-function'
        
        result = lambda_handler(event, context)
        
        # Verify the response
        assert result['statusCode'] == 200, f"Expected status code 200, got {result['statusCode']}"
        
        # Parse the response body
        response_body = json.loads(result['body'])
        
        # Verify the response structure
        assert 'message' in response_body
        assert 'servers_stopped' in response_body
        assert 'servers_failed' in response_body
        assert 'total_servers' in response_body
        assert 'timestamp' in response_body
        
        # Verify the counts
        assert response_body['servers_stopped'] == 2, f"Expected 2 servers stopped, got {response_body['servers_stopped']}"
        assert response_body['servers_failed'] == 0, f"Expected 0 servers failed, got {response_body['servers_failed']}"
        assert response_body['total_servers'] == 3, f"Expected 3 total servers, got {response_body['total_servers']}"
        
        # Verify that stop_mlflow_tracking_server was called twice (for the 2 running servers)
        assert mock_sagemaker_client.stop_mlflow_tracking_server.call_count == 2
        
        print("✅ lambda_handler success test passed")

def test_lambda_handler_no_running_servers():
    """Test the lambda_handler function when no servers are running."""
    print("Testing lambda_handler function (no running servers)...")
    
    domains_response = {
        'Domains': [
            {
                'DomainId': 'd-1234567890abcdef',
                'DomainName': 'test-domain-1',
                'Status': 'InService'
            }
        ]
    }
    
    # All servers are stopped
    mlflow_servers_response = {
        'MlflowTrackingServers': [
            {
                'MlflowTrackingServerName': 'mlflow-server-1',
                'MlflowTrackingServerArn': 'arn:aws:sagemaker:us-east-1:123456789012:mlflow-tracking-server/mlflow-server-1',
                'Status': 'Stopped',
                'DomainId': 'd-1234567890abcdef'
            }
        ]
    }
    
    with patch('boto3.client') as mock_boto3_client:
        # Create mock clients
        mock_sagemaker_client = Mock()
        mock_cloudwatch_client = Mock()
        mock_boto3_client.side_effect = [mock_sagemaker_client, mock_cloudwatch_client]
        
        # Mock the list_domains call
        mock_sagemaker_client.list_domains.return_value = domains_response
        
        # Mock the paginator for list_mlflow_tracking_servers
        mock_paginator = Mock()
        mock_sagemaker_client.get_paginator.return_value = mock_paginator
        mock_paginator.paginate.return_value = [mlflow_servers_response]
        
        # Call the lambda handler
        event = {}
        context = Mock()
        context.function_name = 'test-function'
        
        result = lambda_handler(event, context)
        
        # Verify the response
        assert result['statusCode'] == 200, f"Expected status code 200, got {result['statusCode']}"
        
        # Parse the response body
        response_body = json.loads(result['body'])
        
        # Verify the response
        assert response_body['servers_stopped'] == 0, f"Expected 0 servers stopped, got {response_body['servers_stopped']}"
        assert response_body['total_servers'] == 1, f"Expected 1 total server, got {response_body['total_servers']}"
        
        # Verify that stop_mlflow_tracking_server was not called
        mock_sagemaker_client.stop_mlflow_tracking_server.assert_not_called()
        
        print("✅ lambda_handler no running servers test passed")

def test_lambda_handler_error():
    """Test the lambda_handler function with an error."""
    print("Testing lambda_handler function (error case)...")
    
    with patch('boto3.client') as mock_boto3_client:
        # Create mock clients
        mock_sagemaker_client = Mock()
        mock_cloudwatch_client = Mock()
        mock_boto3_client.side_effect = [mock_sagemaker_client, mock_cloudwatch_client]
        
        # Mock the list_domains call to raise an exception
        mock_sagemaker_client.list_domains.side_effect = Exception("Test error")
        
        # Call the lambda handler
        event = {}
        context = Mock()
        context.function_name = 'test-function'
        
        result = lambda_handler(event, context)
        
        # Verify the response
        assert result['statusCode'] == 500, f"Expected status code 500, got {result['statusCode']}"
        
        # Parse the response body
        response_body = json.loads(result['body'])
        
        # Verify the error response
        assert 'error' in response_body
        assert 'Internal server error' in response_body['error']
        
        print("✅ lambda_handler error test passed")

def main():
    """Run all tests."""
    print("🧪 Starting MLflow shutdown Lambda function tests...\n")
    
    try:
        test_list_mlflow_tracking_servers()
        test_send_metrics()
        test_lambda_handler_success()
        test_lambda_handler_no_running_servers()
        test_lambda_handler_error()
        
        print("\n🎉 All tests passed successfully!")
        print("The Lambda function is ready for deployment.")
        
    except Exception as e:
        print(f"\n❌ Test failed: {str(e)}")
        sys.exit(1)

if __name__ == "__main__":
    main() 