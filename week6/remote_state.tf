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
