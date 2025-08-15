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



## Advanced Task: MFA Enforcement IAM Role

**Task Description**: Create an IAM role with a policy that restricts access to AWS resources (e.g., S3) unless MFA is enabled. Due to permission restrictions (no "Create Policy" button), I’ve documented the steps and explained MFA enforcement.

**Steps**:
1. Go to IAM Console > Roles > **Create Role**.
2. Select **AWS Service: EC2** as the trusted entity. Trust policy:
   ```json
   {
       "Version": "2012-10-17",
       "Statement": [
           {
               "Effect": "Allow",
               "Action": "sts:AssumeRole",
               "Principal": {
                   "Service": "ec2.amazonaws.com"
               }
           }
       ]
   }
3. On Add Permissions, click Create Policy (unavailable in my environment).
4. In the JSON tab, add the MFA enforcement policy:
   ```json
   {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::grocerymate-logs-kb",
            "Condition": {
                "Bool": {
                    "aws:MultiFactorAuthPresent": "true"
                }
            }
        },
        {
            "Effect": "Deny",
            "Action": "s3:*",
            "Resource": "*",
            "Condition": {
                "BoolIfExists": {
                    "aws:MultiFactorAuthPresent": "false"
                }
            }
        }
    ]
   }

- Policy Name: MFAEnforcedS3Policy
- Resource: Uses grocerymate-logs-kb (same bucket as Task 1 and 2).

5. Attach MFAEnforcedS3Policy to the role, remove other policies.
   
6. Name the role: MFAEnforcedS3AccessRole.
    - Description: “Grants S3 read access to EC2 instances, only with MFA.”
    - Tags (optional): Key: Purpose, Value: MFAEnforcement.


7. Click Create Role.

##MFA Enforcement Explanation:

Purpose: Restricts S3 access to MFA-authenticated users or entities, enhancing security.
Mechanism: The aws:MultiFactorAuthPresent condition:

Allow permits s3:ListBucket only if MFA is enabled (true).
Deny blocks all S3 actions if MFA is absent (false).


Security Benefit: MFA requires a second factor (e.g., phone app), reducing unauthorized access risks.
AWS Context: Aligns with IAM best practices for secure resource access.

##Permission Restrictions:

Couldn’t create the policy due to missing iam:CreatePolicy permissions (no Create Policy button).
Documented steps as per task requirements.
