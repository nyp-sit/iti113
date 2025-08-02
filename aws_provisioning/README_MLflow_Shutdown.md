# MLflow Tracking Server Shutdown Lambda

This project provides an automated solution to stop all running SageMaker MLflow tracking servers at a scheduled time (e.g., midnight) to reduce costs and ensure proper resource management.

## Overview

The solution consists of:
- **Lambda Function**: Automatically stops all running MLflow tracking servers
- **EventBridge Rule**: Schedules the Lambda function to run at specified times
- **IAM Role**: Provides necessary permissions for SageMaker and CloudWatch access
- **CloudWatch Metrics**: Monitors the shutdown process and provides insights

## Features

- ✅ Automatically stops all running MLflow tracking servers across all SageMaker domains
- ✅ Configurable scheduling using cron expressions
- ✅ Comprehensive logging and error handling
- ✅ CloudWatch metrics for monitoring
- ✅ Cost-effective (only runs when scheduled)
- ✅ Safe operation (only stops running servers)

## Prerequisites

1. **AWS CLI** installed and configured with appropriate permissions
2. **AWS Account** with access to:
   - Lambda
   - EventBridge
   - CloudFormation
   - SageMaker
   - CloudWatch
   - IAM

## Quick Start

### 1. Deploy with Default Settings (Midnight UTC)

```bash
./deploy_mlflow_shutdown.sh
```

This will deploy the Lambda function to stop MLflow servers at midnight UTC every day.

### 2. Deploy with Custom Schedule

```bash
# Stop servers at 10 PM UTC every day
./deploy_mlflow_shutdown.sh -c 'cron(0 22 * * ? *)'

# Stop servers at 6 AM UTC every Monday
./deploy_mlflow_shutdown.sh -c 'cron(0 6 ? * MON *)'

# Stop servers at midnight on the 1st of every month
./deploy_mlflow_shutdown.sh -c 'cron(0 0 1 * ? *)'
```

### 3. Deploy and Test

```bash
./deploy_mlflow_shutdown.sh --test
```

This will deploy the function and immediately test it to ensure it works correctly.

## Configuration Options

### Command Line Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `-s, --stack-name` | CloudFormation stack name | `mlflow-shutdown-stack` |
| `-r, --region` | AWS region | `us-east-1` |
| `-c, --cron` | Cron expression for shutdown time | `cron(0 0 * * ? *)` |
| `-n, --function-name` | Lambda function name | `mlflow-server-shutdown` |
| `--timeout` | Lambda timeout in seconds | `300` |
| `--memory-size` | Lambda memory size in MB | `256` |
| `--test` | Test the function after deployment | `false` |
| `--force` | Force update existing stack | `false` |

### Environment Variables

You can also set these environment variables:

```bash
export AWS_REGION=us-west-2
export SHUTDOWN_TIME="cron(0 22 * * ? *)"
export LAMBDA_FUNCTION_NAME="my-mlflow-shutdown"
export LAMBDA_TIMEOUT=600
export LAMBDA_MEMORY_SIZE=512
```

## Cron Expression Format

The schedule uses CloudWatch Events cron expressions:

```
cron(minutes hours day-of-month month day-of-week year)
```

### Common Examples

| Expression | Description |
|------------|-------------|
| `cron(0 0 * * ? *)` | Midnight UTC every day |
| `cron(0 22 * * ? *)` | 10 PM UTC every day |
| `cron(0 0 ? * MON *)` | Midnight UTC every Monday |
| `cron(0 0 1 * ? *)` | Midnight UTC on the 1st of every month |
| `cron(0 6 * * ? *)` | 6 AM UTC every day |
| `cron(0 0 ? * SUN *)` | Midnight UTC every Sunday |

## Monitoring

### CloudWatch Metrics

The Lambda function sends the following metrics to CloudWatch:

- **ServersStopped**: Number of servers successfully stopped
- **ServersFailed**: Number of servers that failed to stop
- **TotalServers**: Total number of MLflow servers found
- **ShutdownSuccess**: Whether the overall process succeeded (1) or failed (0)

### CloudWatch Logs

All Lambda function logs are available in CloudWatch Logs under:
```
/aws/lambda/mlflow-server-shutdown
```

### Manual Testing

You can manually test the Lambda function:

```bash
# Get the function name from stack outputs
FUNCTION_NAME=$(aws cloudformation describe-stacks \
    --stack-name mlflow-shutdown-stack \
    --query 'Stacks[0].Outputs[?OutputKey==`LambdaFunctionName`].OutputValue' \
    --output text)

# Invoke the function
aws lambda invoke \
    --function-name "$FUNCTION_NAME" \
    --payload '{}' \
    response.json

# View the response
cat response.json | jq '.'
```

## Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   EventBridge   │───▶│   Lambda Function│───▶│   SageMaker     │
│   (Scheduler)   │    │                  │    │   MLflow API    │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                │
                                ▼
                       ┌──────────────────┐
                       │   CloudWatch     │
                       │   (Metrics &     │
                       │    Logs)         │
                       └──────────────────┘
```

## IAM Permissions

The Lambda function requires the following permissions:

- `sagemaker:ListDomains` - List all SageMaker domains
- `sagemaker:ListMlflowTrackingServers` - List MLflow servers in domains
- `sagemaker:StopMlflowTrackingServer` - Stop running MLflow servers
- `sagemaker:DescribeMlflowTrackingServer` - Get server details
- `cloudwatch:PutMetricData` - Send metrics to CloudWatch

## Troubleshooting

### Common Issues

1. **Permission Denied**
   - Ensure your AWS credentials have the necessary permissions
   - Check that the Lambda execution role was created correctly

2. **No Servers Found**
   - Verify that MLflow tracking servers exist in your SageMaker domains
   - Check that the servers are in the "InService" status

3. **Function Timeout**
   - Increase the Lambda timeout if you have many servers
   - Consider increasing memory allocation for better performance

4. **Schedule Not Working**
   - Verify the cron expression format
   - Check that the EventBridge rule is enabled
   - Ensure the Lambda function has permission to be invoked by EventBridge

### Debugging

1. **Check CloudWatch Logs**:
   ```bash
   aws logs tail /aws/lambda/mlflow-server-shutdown --follow
   ```

2. **Check EventBridge Rule**:
   ```bash
   aws events list-rules --name-prefix mlflow-server-shutdown
   ```

3. **Check Lambda Function**:
   ```bash
   aws lambda get-function --function-name mlflow-server-shutdown
   ```

## Cost Optimization

- The Lambda function only runs when scheduled (typically once per day)
- Execution time is minimal (usually under 30 seconds)
- Memory usage is optimized (256 MB default)
- CloudWatch logs are retained for only 14 days

## Security Considerations

- The Lambda function only has the minimum required permissions
- All API calls are logged for audit purposes
- No sensitive data is stored or transmitted
- The function only stops servers, never starts them

## Cleanup

To remove the entire stack:

```bash
aws cloudformation delete-stack --stack-name mlflow-shutdown-stack
```

This will remove:
- Lambda function
- IAM role
- EventBridge rule
- CloudWatch log group
- All associated resources

## Support

For issues or questions:
1. Check the CloudWatch logs for detailed error messages
2. Verify your AWS credentials and permissions
3. Ensure the cron expression is correctly formatted
4. Test the function manually to isolate issues

## License

This project is provided as-is for educational and operational purposes. 