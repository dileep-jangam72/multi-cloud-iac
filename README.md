# Multi-Cloud Demo with Terraform

This repository demonstrates a **multi-cloud setup**:

- **AWS** → S3 storage bucket  
- **Azure** → Azure SQL Database  
- **GCP** → Kubernetes cluster (GKE)  

## Structure
- `modules/` contains reusable Terraform modules.
- `envs/` contains cloud-specific root configs (AWS, Azure, GCP).
- `.github/workflows/terraform-ci.yml` validates and plans Terraform code.

## How to Use
1. Configure credentials for each cloud:
   - AWS: `AWS_ACCESS_KEY_ID` + `AWS_SECRET_ACCESS_KEY`
   - Azure: `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`
   - GCP: Service Account JSON file

2. Run:
   ```bash
   terraform init
   terraform plan
   terraform apply
