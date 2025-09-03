#!/bin/bash

# AWS CLI script to remove all S3 buckets except 'nyp-aicourse'
# This script includes safety checks and confirmation prompts

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Protected bucket name
PROTECTED_BUCKET="nyp-aicourse"

echo -e "${YELLOW}AWS S3 Bucket Cleanup Script${NC}"
echo -e "${YELLOW}==============================${NC}"
echo -e "${GREEN}Protected bucket: ${PROTECTED_BUCKET}${NC}"
echo ""

# Check if AWS CLI is installed and configured
if ! command -v aws &> /dev/null; then
    echo -e "${RED}Error: AWS CLI is not installed or not in PATH${NC}"
    exit 1
fi

# Check AWS credentials
if ! aws sts get-caller-identity &> /dev/null; then
    echo -e "${RED}Error: AWS credentials not configured or invalid${NC}"
    echo "Please run 'aws configure' to set up your credentials"
    exit 1
fi

echo -e "${GREEN}AWS CLI configured successfully${NC}"
echo "Current AWS identity:"
aws sts get-caller-identity --query '[Account,UserId,Arn]' --output table
echo ""

# Get list of all buckets
echo "Fetching list of S3 buckets..."
BUCKETS=$(aws s3api list-buckets --query 'Buckets[].Name' --output text)

if [ -z "$BUCKETS" ]; then
    echo -e "${YELLOW}No S3 buckets found in your account${NC}"
    exit 0
fi

echo -e "${GREEN}Found buckets:${NC}"
for bucket in $BUCKETS; do
    if [ "$bucket" = "$PROTECTED_BUCKET" ]; then
        echo -e "  ${GREEN}$bucket (PROTECTED - will be kept)${NC}"
    else
        echo -e "  ${RED}$bucket (will be deleted)${NC}"
    fi
done
echo ""

# Filter out the protected bucket
BUCKETS_TO_DELETE=$(echo $BUCKETS | tr ' ' '\n' | grep -v "^${PROTECTED_BUCKET}$" | tr '\n' ' ')

if [ -z "$BUCKETS_TO_DELETE" ]; then
    echo -e "${YELLOW}No buckets to delete. Only the protected bucket '${PROTECTED_BUCKET}' exists.${NC}"
    exit 0
fi

# Confirmation prompt
echo -e "${RED}WARNING: This will permanently delete the following buckets and ALL their contents:${NC}"
for bucket in $BUCKETS_TO_DELETE; do
    echo -e "  ${RED}- $bucket${NC}"
done
echo ""
echo -e "${YELLOW}The bucket '${PROTECTED_BUCKET}' will be preserved.${NC}"
echo ""

read -p "Are you sure you want to continue? Type 'DELETE' to confirm: " confirmation

if [ "$confirmation" != "DELETE" ]; then
    echo -e "${YELLOW}Operation cancelled${NC}"
    exit 0
fi

# Function to delete a bucket and its contents
delete_bucket() {
    local bucket_name=$1
    echo -e "${YELLOW}Processing bucket: $bucket_name${NC}"
    
    # Check if bucket has versioning enabled
    VERSIONING=$(aws s3api get-bucket-versioning --bucket "$bucket_name" --query 'Status' --output text 2>/dev/null || echo "None")
    
    if [ "$VERSIONING" = "Enabled" ]; then
        echo "  Versioning is enabled. Deleting all object versions..."
        aws s3api delete-objects --bucket "$bucket_name" \
            --delete "$(aws s3api list-object-versions --bucket "$bucket_name" \
            --query '{Objects: Versions[].{Key: Key, VersionId: VersionId}}' \
            --output json)" 2>/dev/null || true
            
        # Delete delete markers
        aws s3api delete-objects --bucket "$bucket_name" \
            --delete "$(aws s3api list-object-versions --bucket "$bucket_name" \
            --query '{Objects: DeleteMarkers[].{Key: Key, VersionId: VersionId}}' \
            --output json)" 2>/dev/null || true
    else
        echo "  Deleting all objects..."
        aws s3 rm "s3://$bucket_name" --recursive 2>/dev/null || true
    fi
    
    # Delete the bucket
    echo "  Deleting bucket..."
    if aws s3api delete-bucket --bucket "$bucket_name" 2>/dev/null; then
        echo -e "  ${GREEN}✓ Successfully deleted bucket: $bucket_name${NC}"
    else
        echo -e "  ${RED}✗ Failed to delete bucket: $bucket_name${NC}"
        echo "    This might be due to remaining objects or bucket policies"
    fi
    echo ""
}

# Delete each bucket
echo -e "${YELLOW}Starting deletion process...${NC}"
echo ""

for bucket in $BUCKETS_TO_DELETE; do
    delete_bucket "$bucket"
done

echo -e "${GREEN}Cleanup process completed!${NC}"
echo -e "${GREEN}Protected bucket '${PROTECTED_BUCKET}' has been preserved.${NC}"

# Show remaining buckets
echo ""
echo "Remaining buckets:"
aws s3 ls
