# Azure Landing Zone

## What this project does
Provisions a foundational Azure Landing Zone using Terraform including:
- Resource Group in Australia East
- Azure Policy enforcing mandatory Environment tagging across all resources

## Azure services used
- Azure Resource Groups
- Azure Policy

## AWS equivalent
This replicates AWS Control Tower + Config Rules using native Azure governance tools.

## How to deploy
```bash
terraform init
terraform plan
terraform apply
```

## Author
Tanupriya Dehariya — AWS/Azure Cloud Engineer
