# Week 4 Summary

- Learned RDS basics (Relational Databases in AWS)
- Created and configured RDS instance with Terraform
- Tested DB connection to EC2
- Explored basic backup strategies
- Completed Udemy Course Sessions 9-10
Bonus: Amazon ECR
- Pushed grocerymate image to ECR: 971422704696.dkr.ecr.eu-central-1.amazonaws.com/grocerymate
- Deployed on EC2 (i-07452ddb33765b87b, IP 52.59.199.35), verified via ALB on port 5000
- Commands: aws ecr create-repository, docker push, docker pull
- Note: Rebuilt image on EC2 for AMD64 compatibility; app uses port 5000
