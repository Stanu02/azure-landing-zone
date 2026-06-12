# Azure Cloud Projects

I built these to get my hands on Azure after years on AWS. All infrastructure is Terraform. All projects are things I actually ran, broke, fixed, and learned from.

## Projects

| Project | What I built | Services |
|---------|-------------|---------|
| [Project 1 - Landing Zone](./project1-landing-zone) | Resource group + Azure Policy for tag enforcement | Resource Groups, Azure Policy |
| [Project 2 - Hub-Spoke Network](./project2-hub-spoke) | Hub-spoke VNet topology with peering and NSGs | VNet, Subnets, VNet Peering, NSG |
| [Project 3 - AKS + ACR + Key Vault](./project3-aks) | Kubernetes cluster wired up to a container registry and Key Vault | AKS, ACR, Key Vault |
| [Project 4 - CI/CD Pipeline](./project4-cicd) | GitHub Actions pipeline that auto-deploys on every push | App Service, GitHub Actions |
| [Project 5 - SIEM](./project5-defender-siem) | Simulated SSH brute-force attack, detected it with Sentinel, investigated with KQL | Log Analytics, Microsoft Sentinel |

## About

Coming from AWS (Control Tower, IAM, VPC, GuardDuty, EKS) — the concepts carry over, the tools just have different names.

## Author
Tanupriya Dehariya
