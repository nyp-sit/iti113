#!/bin/bash

# Function to validate team name format
validate_team_name() {
    local team_name=$1
    if [[ ! "$team_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo "Error: Team name '$team_name' contains invalid characters. Use only letters, numbers, hyphens, and underscores."
        return 1
    fi
    return 0
}

# Function to delete domain for a specific team
delete_team_domain() {
    local team_name=$1
    local stack_name="${team_name}-sagemaker"
    
    echo "Deleting SageMaker domain for team: $team_name"
    echo "Stack name: $stack_name"
    
    # Validate team name
    if ! validate_team_name "$team_name"; then
        exit 1
    fi
    
    # Check if stack exists
    if ! aws cloudformation describe-stacks --stack-name "$stack_name" >/dev/null 2>&1; then
        echo "Stack $stack_name does not exist. Cannot delete."
        exit 1
    fi
    
    # Delete CloudFormation stack
    aws cloudformation delete-stack --stack-name "$stack_name"
    
    if [ $? -eq 0 ]; then
        echo "Successfully initiated deletion of stack: $stack_name"
        echo "Check AWS CloudFormation console to monitor progress."
        echo "To check status: aws cloudformation describe-stacks --stack-name $stack_name"
        
        # Clean up parameter file if it exists
        local param_file="parameters-${team_name}.json"
        if [ -f "$param_file" ]; then
            rm "$param_file"
            echo "Cleaned up parameter file: $param_file"
        fi
    else
        echo "Failed to delete stack: $stack_name"
        exit 1
    fi
}

# Main execution
if [ $# -eq 0 ]; then
    echo "Usage: $0 <team_name>"
    echo "Example: $0 team1"
    exit 1
fi

TEAM_NAME=$1
delete_team_domain "$TEAM_NAME" 