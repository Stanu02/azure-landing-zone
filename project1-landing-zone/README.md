# Project 1 - Azure Landing Zone

First project. Wanted to understand how Azure handles governance before touching anything else.

## What I built

- Resource Group in Australia East
- Azure Policy that enforces an Environment tag on everything inside it — if a resource doesn't have the tag, Azure blocks it

## Why this first

On AWS I used Control Tower and Config Rules for the same thing. Wanted to see how Azure does it. Answer: Azure Policy is more straightforward to write but less automated out of the box than Control Tower.

## AWS equivalent

- Resource Group = logical container like an AWS account boundary
- Azure Policy = AWS Config Rules + SCPs combined

## How to deploy

```bash
terraform init
terraform plan
terraform apply
```

## Author
Tanupriya Dehariya
