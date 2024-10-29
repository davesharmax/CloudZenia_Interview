## Problem-2 AWS Infrastructure Setup with Terraform

This project provides Terraform configurations to deploy an AWS infrastructure that includes an EC2 instance configured with domain-based routing,
Docker, and NGINX for content serving. The setup also supports SSL certificates for secure HTTPS access.

### Workflow
Provider Configuration (provider.tf): Configures the AWS provider, specifying the region for resource deployment.

Main Module Orchestration (main.tf): Calls the EC2 instance and security group modules, passing necessary variables and dependencies.

### Reusable Modules:

EC2 Instance Module (modules/ec2_instance/): Creates an EC2 instance, accepts AMI and instance type as inputs, and outputs the instance ID.
Security Group Module (modules/security_group/): Configures a security group allowing HTTP and HTTPS access and outputs the security group ID.
Variable Management (variables.tf): Stores variables for dynamic configuration, allowing customization without modifying the core code.

Outputs (outputs.tf): Outputs important resource IDs (e.g., instance and security group IDs) for easy reference post-deployment.

Usage
#### Initialize Terraform:

     terraform init

#### Plan the deployment:

     terraform plan
#### Deploy the resources:
   
    terraform apply

### Clean up resources after testing:

    terraform destroy

