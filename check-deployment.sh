#!/bin/bash

# Script to check deployment status and get the URL for AWS Amplify app

# Configuration
APP_ID="d2tj903phht9yk"
REGION="us-east-1"
AWS_PROFILE="vim-ai-admin"

# Print usage information
echo "=== AWS Amplify Deployment Status ==="
echo "App ID: $APP_ID"
echo "Region: $REGION"
echo "AWS Profile: $AWS_PROFILE"
echo ""

# List all branches
echo "=== Branches ==="
aws amplify list-branches --app-id $APP_ID --profile $AWS_PROFILE --output json | jq -r '.branches[] | "Branch: \(.branchName) | Status: \(.activeJobId // "No active job") | Last updated: \(.updateTime)"'
echo ""

# Get the app domain
DOMAIN=$(aws amplify get-app --app-id $APP_ID --profile $AWS_PROFILE --output json | jq -r '.app.defaultDomain')
echo "=== URLs ==="
echo "Main branch: https://main.$DOMAIN"
echo "Feature branch: https://feature-test-auto-branch.$DOMAIN"
echo ""

# Check if a branch name was provided
if [ -n "$1" ]; then
  BRANCH_NAME="$1"
  echo "=== Checking deployment for branch: $BRANCH_NAME ==="
  
  # Get the latest job ID
  JOB_ID=$(aws amplify list-jobs --app-id $APP_ID --branch-name $BRANCH_NAME --profile $AWS_PROFILE --output json | jq -r '.jobSummaries[0].jobId // "No jobs found"')
  
  if [ "$JOB_ID" != "No jobs found" ]; then
    echo "Latest job ID: $JOB_ID"
    echo "Job status:"
    aws amplify get-job --app-id $APP_ID --branch-name $BRANCH_NAME --job-id $JOB_ID --profile $AWS_PROFILE --output json | jq -r '.job.summary.status'
    echo ""
    echo "Job URL: https://$BRANCH_NAME.$DOMAIN"
  else
    echo "No jobs found for branch $BRANCH_NAME"
  fi
fi

echo ""
echo "To check a specific branch, run: ./check-deployment.sh BRANCH_NAME" 