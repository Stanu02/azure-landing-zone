# Project 2 - Hub-Spoke Network

## What I built

Three VNets connected in a hub-spoke topology. Hub in the middle, two spokes hanging off it. NSG on the hub subnet with SSH allow and deny-all rules.

## Why hub-spoke

Most enterprise networks use this pattern. Central hub for shared services like firewalls and VPN. Spokes for individual workloads. Spokes can't talk to each other directly — everything goes through the hub.

## One thing that caught me out

Azure VNet peering is not automatic in both directions. You need two peering rules per connection — hub to spoke AND spoke to hub. AWS Transit Gateway handles this automatically. Azure doesn't.

## AWS equivalent

- VNet = AWS VPC
- VNet Peering = Transit Gateway attachments
- NSG = Security Groups + NACLs

## How to deploy

```bash
terraform init
terraform plan
terraform apply
```

## Author
Tanupriya Dehariya
