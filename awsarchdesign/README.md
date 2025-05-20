# AWS Infrastructure Design for Containerized Web Application

This architecture outlines a **scalable and secure AWS setup** for running a containerized web application using EC2, ALB, VPC, and RDS.

---

## Architecture Overview

### VPC Setup
- **Custom VPC**
- **2 Public Subnets** (in different AZs): For ALB
- **2 Private Subnets** (in different AZs): For EC2 and RDS/MongoDB

### Compute
- **EC2 Instances** in private subnets
- Managed via an **Auto Scaling Group (ASG)**
- Placed behind an **Application Load Balancer (ALB)** in public subnets

### Database
- **Amazon RDS** (or MongoDB on EC2) deployed in **private subnets**
- **Multi-AZ enabled** for high availability

### IAM & Security
- **IAM roles**:
  - EC2 role with permissions for ECR, CloudWatch, etc.
- **Security Groups**:
  - ALB: Allows inbound HTTP(S) from the internet
  - EC2: Allows traffic only from ALB
  - RDS: Allows traffic only from EC2

---

## Architecture Components

```plaintext
            ┌────────────────────────────────────────────┐
            │                 Internet                   │
            └────────────────────────────────────────────┘
                        │
                        ▼
                ┌────────────────┐
                │  Application   │
                │ Load Balancer  │
                └────────────────┘
                  ▲            ▲
      Public Subnet A    Public Subnet B
         (ALB only)         (ALB only)
            │                  │
            ▼                  ▼
     ┌────────────┐      ┌────────────┐
     │  EC2 ASG   │      │  EC2 ASG   │
     └────────────┘      └────────────┘
         ▲                      ▲
         │                      │
  Private Subnet A      Private Subnet B
         │                      │
         ▼                      ▼
     ┌──────────────┐      ┌──────────────┐
     │    RDS DB    │      │   (Replica)  │
     └──────────────┘      └──────────────┘
```
