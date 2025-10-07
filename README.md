# Azure Infrastructure Deployment with Terraform

This repository contains Terraform configurations to deploy a complete Azure infrastructure including Virtual Machine and supporting resources.

## 🚀 Infrastructure Components

- Resource Group
- Storage Account
- Virtual Network
- Subnet
- Public IP
- Virtual Machine
- Network Security Group
- Key Vault (optional)

## 📁 Project Structure

```
Terraform-in-azure-/
├── parent/
│   ├── main.tf          # Main configuration file
│   └── provider.tf      # Azure provider configuration
└── child/
    ├── resource_group/  # Resource Group module
    │   ├── resourcegroup.tf
    │   └── variables.tf
    ├── storage_account/ # Storage Account module
    │   ├── storageaccount.tf
    │   └── variables.tf
    ├── vnet/           # Virtual Network module
    │   ├── vnet.tf
    │   └── variables.tf
    ├── subnet/         # Subnet module
    │   ├── subnet.tf
    │   └── variables.tf
    ├── Public_ip/      # Public IP module
    │   ├── public_ip.tf
    │   └── variables.tf
    └── VM/             # Virtual Machine module
        ├── Vm.tf
        ├── vm_data.tf
        └── variables.tf
```

## 🔧 Prerequisites

1. [Terraform](https://www.terraform.io/downloads.html) installed (v1.0.0 or newer)
2. [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
3. Azure subscription
4. Azure CLI logged in (`az login`)

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/DhruvRohillacoder/Terraform-in-azure-.git
   cd Terraform-in-azure-
   ```

2. **Navigate to parent directory**
   ```bash
   cd parent
   ```

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Validate the configuration**
   ```bash
   terraform validate
   ```

5. **Review the deployment plan**
   ```bash
   terraform plan
   ```

6. **Apply the configuration**
   ```bash
   terraform apply
   ```

7. **Clean up resources (when needed)**
   ```bash
   terraform destroy
   ```

## 📋 Module Dependencies

The modules are executed in the following order due to dependencies:

1. Resource Group
2. Storage Account & Virtual Network (parallel)
3. Subnet
4. Public IP
5. Virtual Machine

## 🔐 Security Notes

- All sensitive information should be stored in Azure Key Vault
- Use Azure RBAC for access control
- Ensure proper network security group rules
- Follow the principle of least privilege

## 🔍 Terraform Commands Reference

- `terraform init` - Initialize working directory
- `terraform validate` - Validate configuration files
- `terraform plan` - Preview changes
- `terraform apply` - Apply changes
- `terraform destroy` - Remove all resources
- `terraform show` - Show current state
- `terraform output` - Show output values

## 🐛 Troubleshooting

1. **Module not found errors**
   - Ensure all module paths in main.tf are correct
   - Check if all directories exist
   - Run `terraform init` after adding new modules

2. **Azure provider errors**
   - Verify Azure CLI is logged in
   - Check subscription access
   - Validate provider configuration

3. **Resource creation failures**
   - Check Azure quotas and limits
   - Verify resource name availability
   - Review error messages in Azure Portal

## 📝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Author

DhruvRohillacoder

## 🖥️ VM Specification

Below is the recommended VM specification used by the `child/VM` module. You can copy these values into the module's `variables.tf` or override them in your root module.

- 🎯 Purpose: Development / small production workloads
- 🌍 Location: centralindia (changeable via variable)
- 📦 Size (SKU): `Standard_B2ms` — 2 vCPU, 8 GB RAM (good balance for light workloads)
- 💾 OS: Ubuntu 22.04 LTS (image alias in module)
- 🔐 SSH access: Public key authentication (recommended)
- 🔌 Network: NIC attached to subnet; Public IP assigned (optional)
- 🔒 NSG: Allow SSH (22) from trusted IPs; allow application ports you need
- 🔄 Storage: Managed OS disk (StandardSSD_LRS) + optional data disk
- 🧾 Tags: owner, environment, project

Example Terraform variables (place in `child/VM/variables.tf` or pass from `parent/main.tf`):

```hcl
variable "vm_spec" {
  type = object({
    vm_size           = string
    admin_username    = string
    admin_ssh_key     = string
    location          = string
    image_publisher   = string
    image_offer       = string
    image_sku         = string
    os_disk_type      = string
    enable_public_ip  = bool
  })
  default = {
    vm_size          = "Standard_B2ms"
    admin_username   = "azureuser"
    admin_ssh_key    = "ssh-rsa AAAA... your public key ..."
    location         = "centralindia"
    image_publisher  = "Canonical"
    image_offer      = "0001-com-ubuntu-server-jammy"
    image_sku        = "22_04-lts-gen2"
    os_disk_type     = "StandardSSD_LRS"
    enable_public_ip = true
  }
}
```

Quick tips:
- Use an existing Key Vault to store secrets and reference them with `data.azurerm_key_vault_secret` instead of hardcoding.
- For production, choose a higher VM SKU (e.g., `Standard_D4s_v3`) and premium disks (`Premium_LRS`).
- Lock down NSG rules; use Azure Bastion or jumpbox for SSH access instead of exposing port 22 publicly.

---
**Note:** Remember to update the variables in each module according to your requirements before deploying.
