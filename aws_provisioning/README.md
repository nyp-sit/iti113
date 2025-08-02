# SageMaker Domain Management Scripts

This repository contains scripts to manage multiple SageMaker domains for different teams using AWS CloudFormation.

## Overview

The scripts allow you to create, update, and delete SageMaker domains for multiple teams with automatically generated parameters based on team names.

## Files

### Configuration
- `team-config.sh` - Central configuration file containing the list of teams

### Batch Operations (Multiple Teams)
- `create-multiple-domains.sh` - Create domains for all teams in the configuration
- `update-multiple-domains.sh` - Update domains for all teams in the configuration  
- `delete-multiple-domains.sh` - Delete domains for all teams in the configuration

### Individual Team Operations
- `create-team-domain.sh` - Create domain for a single team
- `update-team-domain.sh` - Update domain for a single team
- `delete-team-domain.sh` - Delete domain for a single team

### Legacy Scripts (Single Team)
- `create-domain.sh` - Original script for team5
- `update-domain.sh` - Original script for team5
- `delete-domain.sh` - Original script for team5

## Setup

1. **Configure Teams**: Edit `team-config.sh` to specify your team names:
   ```bash
   TEAMS=("team1" "team4" "team6")
   ```

2. **Make Scripts Executable**:
   ```bash
   chmod +x *.sh
   ```

## Usage

### Batch Operations

Create domains for all configured teams:
```bash
./create-multiple-domains.sh
```

Update domains for all configured teams:
```bash
./update-multiple-domains.sh
```

Delete domains for all configured teams:
```bash
./delete-multiple-domains.sh
```

### Individual Team Operations

Create domain for a specific team:
```bash
./create-team-domain.sh team1
```

Update domain for a specific team:
```bash
./update-team-domain.sh team1
```

Delete domain for a specific team:
```bash
./delete-team-domain.sh team1
```

## Generated Resources

For each team, the scripts will create:

- **CloudFormation Stack**: `{team_name}-sagemaker`
- **SageMaker Domain**: `{team_name}-domain`
- **Studio User**: `{team_name}-member`
- **Team User**: `{team_name}-user`
- **Parameter File**: `parameters-{team_name}.json` (temporary)

## Parameter Generation

The scripts automatically generate team-specific parameters:

- `DomainName`: `{team_name}-domain`
- `StudioUserName`: `{team_name}-member`
- `TeamUserName`: `{team_name}-user`
- `TeamName`: `{team_name}`
- `DefaultInstanceType`: `ml.t3.medium`

## Monitoring

Check the status of all stacks:
```bash
# For all configured teams
for team in team1 team4 team6; do
    aws cloudformation describe-stacks --stack-name ${team}-sagemaker
done

# For a specific team
aws cloudformation describe-stacks --stack-name team1-sagemaker
```

## Error Handling

- Scripts validate team names to ensure they contain only valid characters
- If one team operation fails, the script continues with remaining teams
- Stack existence is checked before update/delete operations
- Parameter files are automatically cleaned up after deletion

## Team Name Requirements

Team names must contain only:
- Letters (a-z, A-Z)
- Numbers (0-9)
- Hyphens (-)
- Underscores (_)

## Examples

### Adding a New Team

1. Edit `team-config.sh`:
   ```bash
   TEAMS=("team1" "team4" "team6" "team7")
   ```

2. Create domain for the new team:
   ```bash
   ./create-team-domain.sh team7
   ```

### Removing a Team

1. Delete the team's domain:
   ```bash
   ./delete-team-domain.sh team4
   ```

2. Remove from configuration:
   ```bash
   # Edit team-config.sh to remove team4
   TEAMS=("team1" "team6")
   ```

## Notes

- All scripts use the same CloudFormation template (`sagemaker_create_domain.yaml`)
- Parameter files are generated dynamically and cleaned up automatically
- The original hardcoded scripts for team5 are preserved for backward compatibility
- Scripts include error handling and validation for robust operation 