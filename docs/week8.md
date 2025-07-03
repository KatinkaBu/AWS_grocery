# Week 8 Bonus

## Overview
This document covers the Week 8 Bonus project for Masterschool, focusing on AWS CLI, IAM, EC2, and S3 integration.

## Project Task 1: AWS CLI with S3
- **List Bucket (Empty)**:
  - Command: `aws s3 ls s3://grocerymate-logs-kb`
  - Output: Empty bucket
  - Screenshot: [s3_ls_empty_PT1.png](week8_submission/s3_ls_empty_PT1.png)
- **Upload File**:
  - Command: `aws s3 cp test.txt s3://grocerymate-logs-kb/test.txt`
  - Output: `upload: ./test.txt to s3://grocerymate-logs-kb/test.txt`
  - Screenshot: [s3_cp_upload_PT1.png](week8_submission/s3_cp_upload_PT1.png)
- **Verify Upload**:
  - Command: `aws s3 ls s3://grocerymate-logs-kb`
  - Output: `2025-07-01 13:28:03 19 test.txt`
  - Screenshot: [s3_ls_test_txt_PT1.png](week8_submission/s3_ls_test_txt_PT1.png)

## Project Task 2: IAM, EC2, and S3
- **EC2 Instance**:
  - Instance ID: `i-0d64dad897d18f619`
  - Name: `grocerymate-ec2-tf`
  - State: `running`
  - Screenshot: [ec2_instance_PT2.png](week8_submission/ec2_instance_PT2.png)
- **IAM Role**:
  - Name: `GrocerymateEC2S3Role`
  - Screenshot: [iam_role_PT2.png](week8_submission/iam_role_PT2.png)
- **IAM Policy**:
  - Name: `GrocerymateS3AccessPolicy`
  - Permissions: `s3:PutObject`, `s3:GetObject`, `s3:DeleteObject`, `s3:ListBucket` for `grocerymate-logs-kb`
  - Screenshot: [iam_policy_PT2.png](week8_submission/iam_policy_PT2.png)
- **S3 Bucket**:
  - Name: `grocerymate-logs-kb`
  - Content: `test.txt`
  - Screenshot: [s3_bucket_PT2.png](week8_submission/s3_bucket_PT2.png)

## Cleanup
- Checked for Auto Scaling Group: `aws autoscaling describe-auto-scaling-groups`
- Action: [Adjusted ASG to 0 capacity or stopped EC2 instance if not in ASG]
- Deleted `test.txt`: `aws s3 rm s3://grocerymate-logs-kb/test.txt`

## Submission
- Uploaded screenshots and CLI outputs to Masterschool.
- Folder: `~/AWS_grocery/week8_submission`
