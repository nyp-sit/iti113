#!/bin/bash

# Function to create parameters for a specific team
create_team_parameters() {
    local team_name=$1
    local param_file="parameters-${team_name}.json"
    
    cat > "$param_file" << EOF
[
  {
    "ParameterKey": "DomainName",
    "ParameterValue": "${team_name}-domain"
  },
  {
    "ParameterKey": "StudioUserName", 
    "ParameterValue": "${team_name}-member"
  },
  {
    "ParameterKey": "TeamUserName",
    "ParameterValue": "${team_name}-user"
  },
  {
    "ParameterKey": "TeamName",
    "ParameterValue": "${team_name}"
  },
  {
    "ParameterKey": "DefaultInstanceType",
    "ParameterValue": "ml.t3.medium"
  }
]
EOF
    echo "Created parameters file: $param_file"
}

# Function to validate team name format
validate_team_name() {
    local team_name=$1
    if [[ ! "$team_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo "Error: Team name '$team_name' contains invalid characters. Use only letters, numbers, hyphens, and underscores."
        return 1
    fi
    return 0
}

# Function to create domain for a specific team
create_team_domain() {
    local team_name=$1
    local stack_name="${team_name}-sagemaker"
    local param_file="parameters-${team_name}.json"
    
    echo "Creating SageMaker domain for team: $team_name"
    echo "Stack name: $stack_name"
    
    # Validate team name
    if ! validate_team_name "$team_name"; then
        exit 1
    fi
    
    # Create team-specific parameters
    create_team_parameters "$team_name"
    
    # Create CloudFormation stack
    aws cloudformation create-stack \
        --stack-name "$stack_name" \
        --template-body file://sagemaker_create_domain.yaml \
        --parameters file://"$param_file" \
        --capabilities CAPABILITY_NAMED_IAM
    
    if [ $? -eq 0 ]; then
        echo "Successfully initiated creation of stack: $stack_name"
        echo "Check AWS CloudFormation console to monitor progress."
        echo "To check status: aws cloudformation describe-stacks --stack-name $stack_name"
    else
        echo "Failed to create stack: $stack_name"
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
create_team_domain "$TEAM_NAME" 