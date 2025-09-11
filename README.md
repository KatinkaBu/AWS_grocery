# AWS Grocery Project 🌱

Welcome to my AWS Grocery project! This repo documents my work deploying the GroceryMate e-commerce app on AWS as part of the Masterschools program. I forked the original app by Alejandro Roman Ibanez and focused on AWS setup using Terraform for infrastructure as code. 

## Overview 🍃
- **Purpose**: Deploy and manage the GroceryMate app on AWS using Terraform for infrastructure setup.
- **AWS Services**: S3 for storage, IAM for authentication, EC2 for instances, RDS for databases, and Terraform for deployment (tried HCP Terraform but documented theoretically as it didn’t work).
- **Status**: Completed Weeks 1-9 with a focus on AWS deployment and repo cleanup.

## Project Structure 🌳
- `docs/`: Project documentation and references (e.g., weekly summaries like `week1.md` to `week9.md`, `trust_policy.json`, `s3_policy.json`).
- `week5/`, `week6/`, `week7/`, `week8_submission/`: Weekly folders with deployment code and configs.
- `infrastructure/`: AWS resource definitions (e.g., `s3.tf`).
- `backend/`, `frontend/`: Adapted GroceryMate application code.

## AWS Setup Instructions 🍀
1. Clone the repo: `git clone https://github.com/KatinkaBu/AWS_grocery.git`.
2. Navigate: `cd AWS_grocery`.
3. Install Terraform: Follow [Terraform docs](https://www.terraform.io/downloads.html).
4. Configure AWS credentials: Set up your AWS CLI with `aws configure`.
5. Initialize Terraform in `week6/`: `terraform init`.
6. Apply the infrastructure: `terraform apply` (review the plan first!).

## App Setup (Optional) 🪲
- The GroceryMate app was forked from [AlejandroRomanIbanez/AWS_grocery](https://github.com/AlejandroRomanIbanez/AWS_grocery).
- Refer to the original README for app-specific setup (e.g., Python, dependencies, `pip install`).
- This repo focuses on AWS deployment; after `terraform apply`, run the app on EC2:
  - Instance: i-07452ddb33765b87b (week4.md, IP 52.59.199.35).
  - Commands: `docker pull 971422704696.dkr.ecr.eu-central-1.amazonaws.com/grocerymate` (week4.md), then start with `docker run -p 5000:5000 grocerymate`.
- Note: Rebuilt image for AMD64 compatibility (week4.md); app uses port 5000.

## Weekly Progress ⛰️
- **Week 1**: Started AWS Cloud Practitioner Certificate, learned initial AWS Console and CLI basics, created basic project structure, tested initial Terraform scripts, completed Udemy Course Sessions 1-3.
- **Week 2**: Deepened IAM basics, introduced AWS S3 fundamentals, deployed first S3 bucket with Terraform, uploaded files via AWS CLI, completed Udemy Course Sessions 4-6.
- **Week 3**: Introduced EC2, created EC2 instance with Terraform, configured Security Group, tested SSH connection, completed Udemy Course Sessions 7-8.
- **Week 4**: Learned RDS basics, created and configured RDS instance with Terraform, tested DB connection to EC2, explored backup strategies, completed Udemy Course Sessions 9-10.
- **Week 5**: Learned monitoring basics with CloudWatch & CloudTrail, configured alarms and logs, understood AWS cost overview, completed Udemy Course Sessions 11-12.
- **Week 6**: Introduced Infrastructure as Code with Terraform & AWS CDK, set up infrastructure folder, wrote scripts for EC2, Security Groups, RDS, practiced AWS CLI & SSO, completed Udemy Session 11, passed quiz with 90+, left Terraform Remote State and HCP open.
- **Week 7**: Deepened AWS S3, deployed S3 bucket with Terraform/CDK, uploaded files, adapted app for S3 avatars, completed Udemy Session 8, passed quiz, left Pre-Signed URLs open.
- **Week 8**: Deepened AWS Auth with IAM, created IAM role, read AWS SSO Q&A, internalized CLI basics, passed quiz, left MFA enforcement open.
- **Week 9**: Cleaned up GitHub repository, finalized README, evaluated and optimized AWS costs, prepared architecture presentation, ensured full understanding of all project parts.

## AWS Presentation 🌿
Check out my presentation outlining the architecture and AWS services used:
- [Link to Presentation] (Add YouTube link once created!)

## Contributions 🪴
This repo contains my AWS deployment work for the GroceryMate app. Suggestions are welcome – open an issue!

## License 🌴
Licensed under MIT (see original GroceryMate license).

