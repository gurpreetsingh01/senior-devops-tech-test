# Terraform Provisioning of Infrastructure

## Step 1: EKS Cluster and ECR Repository Creation

Provisions the underlying AWS infrastructure with Terraform, such as:
- An Amazon EKS (Elastic Kubernetes Service) cluster
- An Amazon ECR (Elastic Container Registry) repository

### Requirements
- AWS account with the correct permissions
- Terraform v1.11.3 installed
- AWS CLI set up
- kubectl installed (for EKS interactions)
- IAM user with EKS/ECR permissions


### EKS Cluster

#### Purpose

EKS cluster provisioned through Terraform serves as the foundational infrastructure for CarTrawler's containerized platform.

I have configured the EKS with:
- Default VPC network and Subnets
- Managed node groups for worker nodes
- IAM service account roles
- Kubernetes 1.32


#### ECR Repository

### Purpose:

Elastic Container Registry (ECR) repository is utilized to store Docker container images to be deployed into the EKS cluster. It serves as the private image registry for all application components in the CarTrawler project.

I have configured the EKS with:
- Private image storage
- Image tag mutability enabled for development flexibility
- Repository access policy allowing necessary ECR actions for deployment


### Usage

Navigate to the eks-cluster-setup-terraform directory

<!-- 
This section provides instructions for initializing, reviewing, and applying a Terraform configuration. 
1. Use `terraform init` to initialize the working directory containing the Terraform configuration files.
2. Use `terraform plan` to create an execution plan, allowing you to review the changes Terraform will make to your infrastructure.
3. Use `terraform apply` to execute the actions proposed in the execution plan and apply the configuration to your infrastructure.
-->
1 Initialize Terraform:

terraform init

2 Review the execution plan:

terraform plan

3 Apply the configuration:

terraform apply



### Usage

Navigate to the ecr-repo-terraform directory

<!-- 
This section provides instructions for initializing, reviewing, and applying a Terraform configuration. 
1. Use `terraform init` to initialize the working directory containing the Terraform configuration files.
2. Use `terraform plan` to create an execution plan, allowing you to review the changes Terraform will make to your infrastructure.
3. Use `terraform apply` to execute the actions proposed in the execution plan and apply the configuration to your infrastructure.
-->
1 Initialize Terraform:

terraform init

2 Review the execution plan:

terraform plan

3 Apply the configuration:

terraform apply


