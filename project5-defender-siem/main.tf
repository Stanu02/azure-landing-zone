# Resource Group
resource "azurerm_resource_group" "siem_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.siem_rg.location
  resource_group_name = azurerm_resource_group.siem_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-defender-siem"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.siem_rg.location
  resource_group_name = azurerm_resource_group.siem_rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-servers"
  resource_group_name  = azurerm_resource_group.siem_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-defender-siem"
  location            = azurerm_resource_group.siem_rg.location
  resource_group_name = azurerm_resource_group.siem_rg.name

  security_rule {
    name                       = "Allow-SSH-From-My-IP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.allowed_ssh_ip
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "vm1_pip" {
  name                = "pip-vm1"
  location            = azurerm_resource_group.siem_rg.location
  resource_group_name = azurerm_resource_group.siem_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_public_ip" "vm2_pip" {
  name                = "pip-vm2"
  location            = azurerm_resource_group.siem_rg.location
  resource_group_name = azurerm_resource_group.siem_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "vm1_nic" {
  name                = "nic-vm1"
  location            = azurerm_resource_group.siem_rg.location
  resource_group_name = azurerm_resource_group.siem_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm1_pip.id
  }
}

resource "azurerm_network_interface" "vm2_nic" {
  name                = "nic-vm2"
  location            = azurerm_resource_group.siem_rg.location
  resource_group_name = azurerm_resource_group.siem_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm2_pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "vm1_nsg" {
  network_interface_id      = azurerm_network_interface.vm1_nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_network_interface_security_group_association" "vm2_nsg" {
  network_interface_id      = azurerm_network_interface.vm2_nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                = "vm1"
  resource_group_name = azurerm_resource_group.siem_rg.name
  location            = azurerm_resource_group.siem_rg.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.vm1_nic.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# vm2
resource "azurerm_linux_virtual_machine" "vm2" {
  name                = "vm2"
  resource_group_name = azurerm_resource_group.siem_rg.name
  location            = azurerm_resource_group.siem_rg.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
  azurerm_network_interface.vm2_nic.id
]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}