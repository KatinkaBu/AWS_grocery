# Week 6 Bonus: DynamoDB
- Created table: `grocerymate-users`.
- Partition key: `user_id` (String).
- Added sample item: `user_id: user1`, `email: user1@example.com`, `name: Alice`.
- Commands: `aws dynamodb create-table`, `put-item`, `get-item`.

# Week 6 Advanced Tasks Documentation

## Advanced Task 1: Remote State in Terraform
**Goal**: Store Terraform state in `grocerymate-logs-kb` for collaboration and versioning.  
**Steps**:  
- Verified S3 bucket `grocerymate-logs-kb` in `eu-central-1`.  
- Created `week6/remote_state.tf`:  
  ```hcl
  terraform {
    backend "s3" {
      bucket = "grocerymate-logs-kb"
      key    = "week6/terraform.tfstate"
      region = "eu-central-1"
    }
  }

  resource "aws_s3_bucket" "test_bucket" {
    bucket = "week6-test-bucket-${random_string.suffix.result}"
    tags = {
      Name = "week6-test-bucket"
    }
  }

  resource "random_string" "suffix" {
    length  = 8
    special = false
    upper   = false
  }
**Commands**:
aws s3api head-bucket --bucket grocerymate-logs-kb
terraform init
terraform apply
aws s3 ls s3://grocerymate-logs-kb/week6/
**Output**:
- Verified bucket in eu-central-1.
- Initialized S3 backend for s3://grocerymate-logs-kb/week6/terraform.tfstate.
- Created bucket week6-test-bucket-<random_string>.
- S3 output: terraform.tfstate (or noted permissions issue).
- Screenshot: week6_remote_state.png (see notion page)
- Notes: Used GrocerymateS3AccessPolicy from Week 8.

  
