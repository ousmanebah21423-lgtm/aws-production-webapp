# aws-production-webapp



\# 🚀 Production-Ready Web Application on AWS



\## 📌 Project Overview

This project demonstrates how to deploy a \*\*highly available, production-ready web application on AWS\*\* using modern cloud best practices.

The application is served by \*\*NGINX\*\*, runs on \*\*EC2 instances managed by an Auto Scaling Group\*\*, and is fronted by an \*\*Application Load Balancer\*\* to ensure scalability, fault tolerance, and reliability.



The infrastructure is designed to automatically recover from failures and distribute traffic across multiple Availability Zones.





\## 🏗️ Architecture

\*\*High-level flow:\*\*





\*\*Key characteristics:\*\*

\- Multi-AZ deployment for high availability

\- Automatic instance replacement via Auto Scaling

\- Health checks handled by the ALB

\- Secure networking using Security Groups

\- Internet-facing load balancer with private backend instances



\## ☁️ AWS Services Used



\- \*\*Amazon EC2\*\* – Compute instances running NGINX

\- \*\*Auto Scaling Group (ASG)\*\* – Automatic scaling and self-healing

\- \*\*Application Load Balancer (ALB)\*\* – Traffic distribution and health checks

\- \*\*Target Groups\*\* – Backend instance registration and monitoring

\- \*\*Launch Templates\*\* – Consistent instance configuration

\- \*\*Amazon VPC\*\* – Networking and subnet isolation

\- \*\*Security Groups\*\* – Layer-4 traffic control

\- \*\*Amazon Linux 2 AMI\*\* – Base operating system



\## 🔐 Security Design



\- ALB allows \*\*HTTP (80)\*\* from the internet

\- EC2 instances allow \*\*HTTP (80)\*\* traffic \*\*only from the ALB security group\*\*

\- SSH access restricted (not required for production workflow)

\- Instances are managed exclusively through Auto Scaling (no manual changes)





\## ⚙️ Instance Configuration (User Data)



Each EC2 instance is configured automatically at launch using user data:



```bash

\#!/bin/bash

yum update -y

yum install -y nginx

systemctl start nginx

systemctl enable nginx

echo "<h1>Production Web App - Auto Scaling Group</h1>" > /usr/share/nginx/html/index.html


## 📈 High Availability & Scaling

- Instances are distributed across **multiple Availability Zones**
- Health checks automatically remove unhealthy instances
- Auto Scaling Group replaces failed instances without downtime
- Load Balancer ensures continuous service availability


## 🧪 How to Test

1. Open the **Application Load Balancer DNS name** in a browser:

2. Refresh the page multiple times
3. Stop or terminate an instance and observe:
- Automatic replacement
- No service interruption





