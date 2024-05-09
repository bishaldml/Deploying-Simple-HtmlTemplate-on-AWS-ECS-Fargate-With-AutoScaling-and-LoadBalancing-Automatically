# Deploying simple html template on AWS ECS Fargate with AutoScaling and LoadBalancing automatically with CI/CD
## STEP-1: Launch and Deploy WebApp Image to AWS Fargate.

### S1 : Building VPC
1. Create a VPC.
2. Select "VPC and More"
3. Give "IPv4 CIDR Block"
4. No. of AZ's : 2
5. No. of Public Subnet: 2
6. No. of Private Subnet: 2
7. NAT Gateway: In 1 AZ (for Demo_Purpose only, for real project select "1 per AZ" for HA)
8. Select "Customize Subnets CIDR Blocks":
   1. Public Subnet in ap-southeast-1a: ``` 10.0.1.0/24 ```
   2. Public Subnet in ap-southeast-1b: ``` 10.0.2.0/24 ```
   3. Public Subnet for App in ap-southeast-1a: ``` 10.0.10.0/24 ```
   4. Public Subnet for App in ap-southeast-1b: ``` 10.0.11.0/24 ```
   5. Public Subnet for DB in ap-southeast-1a: ``` 10.0.20.0/24 ```
   6. Public Subnet for DB in ap-southeast-1b: ``` 10.0.21.0/24 ```
9. VPC endpoints: "None" (for Demo Project only)
10. Finally Select "Create VPC"

### S2 : Create a SG for ALB, APP and DB

1. For ALB:
   1. Select SG from VPC Console.
   2. Create SG.
   3. Give Name for SG: bishal_demo-project_SG-ALB
   4. Give Description also.
   5. Select your VPC:
   6. Add Inbound Rules:
      1. Add rule.
      2. In Type: Select HTTP
      3. Source: Anywhere_IPv4
    7. Create SG.
2. For APP:
   1. Same as above.
   2. In Inbound Rule:
      1. In Type: Select HTTP
      2. Source: Custom: LB_SG_ID (Select it in drop-down)
   3. Create SG.
3. For DB:
   1. same.
   2. In Inbound Rule:
      1. In Type: Select "MYSQL/AURORA"
      2. Source: Custom: APP_SG_ID

### S3 : Creating ECR Repository

## STEP-2: CI/CD Pipeline for AWS ECS using CodeCommit, CodeBuild and CodePipeline.
