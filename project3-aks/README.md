# Project 3 - AKS + ACR + Key Vault

## What I built

A Kubernetes cluster wired up to a container registry and a Key Vault. AKS pulls images from ACR using a role assignment — not hardcoded credentials.

## Architecture
![AKS Resources](./screenshots/aks-resources.png)

## Why these three together

This is the standard setup for running containerised apps on Azure. AKS runs the app, ACR stores the Docker image, Key Vault holds the secrets. They don't connect automatically — you have to explicitly give AKS permission to pull from ACR using a role assignment scoped to just that registry.

## Things that didn't go smoothly

- Standard_B2s wasn't available for AKS in Australia East. Switched to Standard_D2s_v3.
- Got an OIDC error because Azure enables it automatically on new clusters. Had to add oidc_issuer_enabled = true to stop Terraform from trying to disable it.

## AWS equivalent

- AKS = AWS EKS
- ACR = AWS ECR
- Key Vault = AWS Secrets Manager + KMS
- Role Assignment = IAM role attached to EC2/EKS node group

## How to deploy

```bash
terraform init
terraform plan
terraform apply
```

## Author
Tanupriya Dehariya
