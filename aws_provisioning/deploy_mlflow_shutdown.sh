#!/bin/bash

# Script to deploy the MLflow tracking server shutdown Lambda function
# This script creates a CloudFormation stack that includes:
# - Lambda function to stop MLflow tracking servers
# - IAM role with necessary permissions
# - EventBridge rule for scheduling
# - CloudWatch log group

set -e

# Configuration
STACK_NAME="mlflow-shutdown-stack"
TEMPLATE_FILE="lambda_mlflow_shutdown_template.yaml"
REGION="${AWS_REGION:-us-east-1}"

# Default parameters
SHUTDOWN_TIME="${SHUTDOWN_TIME:-cron(0 0 * * ? *)}"  # Midnight UTC every day
LAMBDA_FUNCTION_NAME="${LAMBDA_FUNCTION_NAME:-mlflow-server-shutdown}"
LAMBDA_TIMEOUT="${LAMBDA_TIMEOUT:-300}"
LAMBDA_MEMORY_SIZE="${LAMBDA_MEMORY_SIZE:-256}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if AWS CLI is installed and configured
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        print_error "AWS CLI is not installed. Please install it first."
        exit 1
    fi
    
    if ! aws sts get-caller-identity &> /dev/null; then
        print_error "AWS CLI is not configured. Please run 'aws configure' first."
        exit 1
    fi
}

# Function to check if template file exists
check_template() {
    if [ ! -f "$TEMPLATE_FILE" ]; then
        print_error "Template file $TEMPLATE_FILE not found."
        exit 1
    fi
}

# Function to check if stack already exists
check_stack_exists() {
    if aws cloudformation describe-stacks --stack-name "$STACK_NAME" --region "$REGION" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to deploy the stack
deploy_stack() {
    print_status "Deploying CloudFormation stack: $STACK_NAME"
    print_status "Region: $REGION"
    print_status "Shutdown time: $SHUTDOWN_TIME"
    print_status "Lambda function name: $LAMBDA_FUNCTION_NAME"
    print_status "Lambda timeout: $LAMBDA_TIMEOUT seconds"
    print_status "Lambda memory size: $LAMBDA_MEMORY_SIZE MB"
    
    aws cloudformation deploy \
        --template-file "$TEMPLATE_FILE" \
        --stack-name "$STACK_NAME" \
        --parameter-overrides \
            ShutdownTime="$SHUTDOWN_TIME" \
            LambdaFunctionName="$LAMBDA_FUNCTION_NAME" \
            LambdaTimeout="$LAMBDA_TIMEOUT" \
            LambdaMemorySize="$LAMBDA_MEMORY_SIZE" \
        --capabilities CAPABILITY_NAMED_IAM \
        --region "$REGION" \
        --no-fail-on-empty-changeset
}

# Function to update the stack
update_stack() {
    print_status "Updating existing CloudFormation stack: $STACK_NAME"
    
    aws cloudformation deploy \
        --template-file "$TEMPLATE_FILE" \
        --stack-name "$STACK_NAME" \
        --parameter-overrides \
            ShutdownTime="$SHUTDOWN_TIME" \
            LambdaFunctionName="$LAMBDA_FUNCTION_NAME" \
            LambdaTimeout="$LAMBDA_TIMEOUT" \
            LambdaMemorySize="$LAMBDA_MEMORY_SIZE" \
        --capabilities CAPABILITY_NAMED_IAM \
        --region "$REGION" \
        --no-fail-on-empty-changeset
}

# Function to display stack outputs
show_outputs() {
    print_status "Retrieving stack outputs..."
    
    aws cloudformation describe-stacks \
        --stack-name "$STACK_NAME" \
        --region "$REGION" \
        --query 'Stacks[0].Outputs' \
        --output table
}

# Function to test the Lambda function
test_lambda() {
    print_status "Testing Lambda function..."
    
    FUNCTION_NAME=$(aws cloudformation describe-stacks \
        --stack-name "$STACK_NAME" \
        --region "$REGION" \
        --query 'Stacks[0].Outputs[?OutputKey==`LambdaFunctionName`].OutputValue' \
        --output text)
    
    if [ -z "$FUNCTION_NAME" ]; then
        print_error "Could not retrieve Lambda function name from stack outputs"
        return 1
    fi
    
    print_status "Invoking Lambda function: $FUNCTION_NAME"
    
    aws lambda invoke \
        --function-name "$FUNCTION_NAME" \
        --region "$REGION" \
        --payload '{}' \
        response.json
    
    print_status "Lambda function response:"
    cat response.json | jq '.' 2>/dev/null || cat response.json
    rm -f response.json
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help                    Show this help message"
    echo "  -s, --stack-name NAME         CloudFormation stack name (default: mlflow-shutdown-stack)"
    echo "  -t, --template FILE           Template file (default: lambda_mlflow_shutdown_template.yaml)"
    echo "  -r, --region REGION           AWS region (default: us-east-1)"
    echo "  -c, --cron CRON_EXPRESSION    Cron expression for shutdown time (default: cron(0 0 * * ? *))"
    echo "  -n, --function-name NAME      Lambda function name (default: mlflow-server-shutdown)"
    echo "  --timeout SECONDS             Lambda timeout in seconds (default: 300)"
    echo "  --memory-size MB              Lambda memory size in MB (default: 256)"
    echo "  --test                        Test the Lambda function after deployment"
    echo "  --force                       Force deployment even if stack exists"
    echo ""
    echo "Examples:"
    echo "  $0                                    # Deploy with default settings (midnight UTC)"
    echo "  $0 -c 'cron(0 22 * * ? *)'           # Deploy with 10 PM UTC shutdown"
    echo "  $0 -r us-west-2 --test               # Deploy in us-west-2 and test"
    echo "  $0 --force                           # Force update existing stack"
    echo ""
    echo "Cron Expression Format:"
    echo "  cron(minutes hours day-of-month month day-of-week year)"
    echo "  Examples:"
    echo "    cron(0 0 * * ? *)     # Midnight UTC every day"
    echo "    cron(0 22 * * ? *)    # 10 PM UTC every day"
    echo "    cron(0 0 ? * MON *)   # Midnight UTC every Monday"
    echo "    cron(0 0 1 * ? *)     # Midnight UTC on the 1st of every month"
}

# Parse command line arguments
FORCE_DEPLOY=false
TEST_LAMBDA=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_usage
            exit 0
            ;;
        -s|--stack-name)
            STACK_NAME="$2"
            shift 2
            ;;
        -t|--template)
            TEMPLATE_FILE="$2"
            shift 2
            ;;
        -r|--region)
            REGION="$2"
            shift 2
            ;;
        -c|--cron)
            SHUTDOWN_TIME="$2"
            shift 2
            ;;
        -n|--function-name)
            LAMBDA_FUNCTION_NAME="$2"
            shift 2
            ;;
        --timeout)
            LAMBDA_TIMEOUT="$2"
            shift 2
            ;;
        --memory-size)
            LAMBDA_MEMORY_SIZE="$2"
            shift 2
            ;;
        --test)
            TEST_LAMBDA=true
            shift
            ;;
        --force)
            FORCE_DEPLOY=true
            shift
            ;;
        *)
            print_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# Main execution
main() {
    print_status "Starting MLflow shutdown Lambda deployment..."
    
    # Check prerequisites
    check_aws_cli
    check_template
    
    # Check if stack exists
    if check_stack_exists; then
        if [ "$FORCE_DEPLOY" = true ]; then
            print_warning "Stack $STACK_NAME already exists. Updating..."
            update_stack
        else
            print_error "Stack $STACK_NAME already exists. Use --force to update or delete the stack first."
            exit 1
        fi
    else
        print_status "Creating new stack: $STACK_NAME"
        deploy_stack
    fi
    
    # Show outputs
    show_outputs
    
    # Test Lambda function if requested
    if [ "$TEST_LAMBDA" = true ]; then
        test_lambda
    fi
    
    print_success "Deployment completed successfully!"
    print_status "The Lambda function will automatically stop MLflow tracking servers at: $SHUTDOWN_TIME"
    print_status "You can monitor the function in the AWS Lambda console or CloudWatch logs."
}

# Run main function
main "$@" 