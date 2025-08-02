#!/bin/bash

# Source the team configuration
source ./team-config.sh

# Validate team names
if ! validate_all_teams; then
    echo "Error: Invalid team names found. Please check team-config.sh"
    exit 1
fi

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

# Function to update domain for a specific team
update_team_domain() {
    local team_name=$1
    local stack_name="${team_name}-sagemaker"
    local param_file="parameters-${team_name}.json"
    
    echo "Updating SageMaker domain for team: $team_name"
    echo "Stack name: $stack_name"
    
    # Check if stack exists
    if ! aws cloudformation describe-stacks --stack-name "$stack_name" >/dev/null 2>&1; then
        echo "Stack $stack_name does not exist. Skipping update."
        return 1
    fi
    
    # Create team-specific parameters
    create_team_parameters "$team_name"
    
    # Update CloudFormation stack
    aws cloudformation update-stack \
        --stack-name "$stack_name" \
        --template-body file://sagemaker_create_domain.yaml \
        --parameters file://"$param_file" \
        --capabilities CAPABILITY_NAMED_IAM
    
    if [ $? -eq 0 ]; then
        echo "Successfully initiated update of stack: $stack_name"
    else
        echo "Failed to update stack: $stack_name"
        return 1
    fi
}

# Main execution
echo "Updating SageMaker domains for teams: ${TEAMS[*]}"
echo "================================================"

for team in "${TEAMS[@]}"; do
    echo ""
    echo "Processing team: $team"
    update_team_domain "$team"
    
    if [ $? -ne 0 ]; then
        echo "Error updating domain for team: $team"
        # Continue with other teams even if one fails
    fi
done

echo ""
echo "Domain updates initiated for all teams."
echo "Check AWS CloudFormation console to monitor progress."
echo ""
echo "To check status of all stacks:"
for team in "${TEAMS[@]}"; do
    echo "  aws cloudformation describe-stacks --stack-name ${team}-sagemaker"
done 