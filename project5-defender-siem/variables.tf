variable "location" {
  default = "australiaeast"
}

variable "resource_group_name" {
  default = "rg-defender-siem"
}

variable "log_analytics_workspace_name" {
  default = "law-tanu-siem"
}

variable "vm_size" {
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  default = "azureuser"
}

variable "public_key" {
  default = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFzOpMX4mP1op3COX0iLqqyPzk3jiVb+09taHIYPx12Mq35UmlTN8zL9DFWN127leDQ5csIHkg1R0gYEHkuZbuVWcYIqLzuX6aqzHPHlhBk3K+I9OCkbWl0iAHvX8q5PVCnAB1BjnKvqge06pTFODByhJE5OfoEEWS02RPr6Cdwl1Rnu4s0a/FxOcOPgpaAk3CCrx0ehohc5rEOZpgpfprm7SYFXRT1zKiiCbUIiQ3HGQXDMfJGJIllTZxvbwPAcAc8ZUGX27sD4ZKlfWto+qmYTbaKAfj3O8Ai6k0ptcnZOGOxHIiEHvykEXDGxJU7D5GXdJcQZ/O6cDLp64HktOHkTD6uRV1023ZC48GaNRbO4Hr/zhSTsEdtP3QdbCcbJquA6KlG+csj1HmGKwltcBRBCQ4i4v1oEatCG9HZc6sWc87fI1gaz3GJT68GWgVgSvy3vvz1ppUfUAvDyrWJpV8dILw0U375tgOTXjvcEExOteY5iEokFzScR5VABunukbxyRkbDP7ecgTnWAyMkOueZhrw3Jpv1lnJQi96MM1MEmh+BxaT/byXubcBxp4DEUZI+jFTa/1dtB9tpDe4ES07Ap+8Ya/B720NVb5UeLl4sDY9SXUmcJbKoOfKSGFeOKVE20uizUGf8c3ds8AY+wegjp7BLwIXAdLDRDaus6OxMQ== azure-project5
EOF
}

variable "allowed_ssh_ip" {
  default = "171.61.63.138/32"
}