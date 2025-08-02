#!/bin/bash

# Source the team configuration
source ./team-config.sh

# Validate team names
if ! validate_all_teams; then
    echo "Error: Invalid team names found. Please check team-config.sh"
    exit 1
fi

# Function to delete domain for a specific team
delete_team_domain() {
    local team_name=$1
    local stack_name="${team_name}-sagemaker"
    
    echo "Deleting SageMaker domain for team: $team_name"
    echo "Stack name: $stack_name"
    
    # Check if stack exists
    if ! aws cloudformation describe-stacks --stack-name "$stack_name" >/dev/null 2>&1; then
        echo "Stack $stack_name does not exist. Skipping deletion."
        return 1
    fi
    
    # Delete CloudFormation stack
    aws cloudformation delete-stack --stack-name "$stack_name"
    
    if [ $? -eq 0 ]; then
        echo "Successfully initiated deletion of stack: $stack_name"
    else
        echo "Failed to delete stack: $stack_name"
        return 1
    fi
}

# Function to clean up parameter files
cleanup_parameter_files() {
    for team in "${TEAMS[@]}"; do
        local param_file="parameters-${team}.json"
        if [ -f "$param_file" ]; then
            rm "$param_file"
            echo "Cleaned up parameter file: $param_file"
        fi
    done
}

# Main execution
echo "Deleting SageMaker domains for teams: ${TEAMS[*]}"
echo "================================================"

for team in "${TEAMS[@]}"; do
    echo ""
    echo "Processing team: $team"
    delete_team_domain "$team"
    
    if [ $? -ne 0 ]; then
        echo "Error deleting domain for team: $team"
        # Continue with other teams even if one fails
    fi
done

echo ""
echo "Domain deletion initiated for all teams."
echo "Check AWS CloudFormation console to monitor progress."

# Clean up parameter files
echo ""
echo "Cleaning up parameter files..."
cleanup_parameter_files

echo ""
echo "To check status of all stacks:"
for team in "${TEAMS[@]}"; do
    echo "  aws cloudformation describe-stacks --stack-name ${team}-sagemaker"
done 