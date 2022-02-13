# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {}
}



# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "myterraformgroup" {
    name     = "resorses"
    location = "germanywestcentral"
}

# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "myVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "germanywestcentral"
    resource_group_name = azurerm_resource_group.myterraformgroup.name

}

# Create subnet
resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "mySubnet"
    resource_group_name  = azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = "germanywestcentral"
    resource_group_name          = azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
    name                = "myNetworkSecurityGroup"
    location            = "germanywestcentral"
    resource_group_name = azurerm_resource_group.myterraformgroup.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "Terraform Demo"
    }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
    name                      = "myNIC"
    location                  = "germanywestcentral"
    resource_group_name       = azurerm_resource_group.myterraformgroup.name

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = azurerm_subnet.myterraformsubnet.id
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.1.10"
        public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
    }

}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
    network_interface_id      = azurerm_network_interface.myterraformnic.id
    network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = azurerm_resource_group.myterraformgroup.name
    }

    byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = azurerm_resource_group.myterraformgroup.name
    location                    = "germanywestcentral"
    account_tier                = "Standard"
    account_replication_type    = "LRS"

    tags = {
        environment = "Terraform Demo"
    }
}


# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}
output "tls_private_key" {
    value = tls_private_key.example_ssh.private_key_pem
    sensitive = true
}




# Create virtual machine
resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name                  = "test_wordpress"
    location              = "germanywestcentral"
    resource_group_name   = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    size                  = "Standard_B2s"


    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }





    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "testwordpress"
    admin_username = "azureuser"
    admin_password = "Password1234"



    disable_password_authentication = false



    admin_ssh_key {
        username       = "azureuser"
        public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCX5WG+LhwRCgF9IDal0cX5Jr6e0zlcPz+fBf7ikw1s6caqF20p80cJhgJYO+JPszaT91VpVvwH/rWgi7qqQcXiASouI3SMta57H28AblZs3Du00k9jmzPqxpxpukyLMdYW6XSua0+DfIxAmey8unj3DfcOVY4k1U0lf3f4i3u2/CAYHMwxVWOQHN/T1f4Q1lNns4+cOwse8MOkmJjDysTcX1ByC7pLnvWGgIe62WNsoQGBbB2nehm64pgGSqYt+t2ILG8c4epmcwdwbVmb+Vuu4PFaENvwkJ3RCRVNPySGA1YJa5QWDADwC68hWrtaI9JE3hxMzRPMUheKXgEVrsCfBfeZtTS6oNq93666zFDKU7cp+JbNZ+hmbwX0z9MfT9csLvG8cU8oStRvoJyBviKm7Lune/G7xjr+W7Hgl1f88ZRGLhcmJvhHdUvndN5RRLgkz25+V+7IxEJQKOcVJYLW4tPIV1o0NhFzihAtOR/Tan3yH45LOfJtVsDDuP5Zgyk= root@vagrant"

    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }


    #connection {
    #host     = self.public_ip_address
    #user     = self.admin_username
    #password = self.admin_password
    #}

    #provisioner "file" {
    #source      = "boot.sh"
   # destination = "/tmp/boot.sh"
  #}

    #provisioner "remote-exec" {
    #inline = [
    # "ls -la /tmp",
    #  "chmod +x /tmp/boot.sh",
    #  "/tmp/boot.sh",
    #]
    #}

}
