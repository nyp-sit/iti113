#!/bin/bash

# Configuration file for team management
# Modify this array to add/remove teams as needed
# TEAMS=("iti113-team2" "iti113-team5" "iti113-team7" "iti113-team8" "iti113-team12" "iti113-team16")
TEAMS=("iti113-team5")

# Function to validate team name format
validate_team_name() {
    local team_name=$1
    if [[ ! "$team_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo "Error: Team name '$team_name' contains invalid characters. Use only letters, numbers, hyphens, and underscores."
        return 1
    fi
    return 0
}

# Function to validate all team names
validate_all_teams() {
    for team in "${TEAMS[@]}"; do
        if ! validate_team_name "$team"; then
            return 1
        fi
    done
    return 0
}

# Export teams array for use in other scripts
export TEAMS 
