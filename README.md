# Azure Virtual Machine Deployment with Terraform

This repository automates the deployment of a complete Azure infrastructure using Terraform modules. It provisions a resource group, storage account, virtual network, subnet, public IP, and a virtual machine, following Azure best practices for modularity and security.

## Project Structure

```
Terraform-in-azure-/
├── parent/
│   ├── main.tf          # Root module: assembles all child modules
│   └── provider.tf      # Azure provider and backend configuration
├── child/
│   ├── resource_group/  # Resource Group module
│   ├── storage_account/ # Storage Account module
│   ├── vnet/            # Virtual Network module
│   ├── subnet/          # Subnet module
│   ├── Public_ip/       # Public IP module
│   └── VM/              # Virtual Machine module
```

## Features

- **Modular Design:** Each Azure resource is defined in its own module for reusability and clarity.
- **Remote State:** Uses Azure Storage Account for storing Terraform state securely.
- **Dependency Management:** Ensures resources are created in the correct order using `depends_on`.
- **Secrets Management:** (Recommended) Use Azure Key Vault for sensitive data like VM credentials.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Azure CLI installed and authenticated (`az login`)
- Sufficient permissions in your Azure subscription
- **(For remote backend setup, run this one-liner in terminal to create backend resources quickly):**

  ```powershell
  az group create --name apptf --location eastus; az storage account create --name apptfstg --resource-group apptf --location eastus --sku Standard_LRS --kind StorageV2; $key = (az storage account keys list --resource-group apptf --account-name apptfstg --query "[0].value" -o tsv); az storage container create --name tfstate --account-name apptfstg --account-key $key
  ```

  - This will create a resource group, storage account, and container for Terraform remote state in one step.

## Usage

1. **Clone the repository**

   ```sh
   git clone <your-repo-url>
   cd Terraform-in-azure-/parent
   ```

2. **Initialize Terraform**

   ```sh
   terraform init
   ```

3. **Validate the configuration**

   ```sh
   terraform validate
   ```

4. **Preview the changes**

   ```sh
   terraform plan
   ```

5. **Apply the configuration**
   ```sh
   terraform apply
   ```

## Customization

- Edit variables in each child module to customize resource names, sizes, locations, etc.
- Update `provider.tf` for your Azure subscription and backend storage details.

## Best Practices

- **Use remote state** for collaboration and disaster recovery.
- **Store secrets in Azure Key Vault** and reference them in your modules.
- **Modularize resources** for easier maintenance and scalability.
- **Review and commit your Terraform state files securely.**

## Troubleshooting

- Ensure all paths in `main.tf` are correct and modules exist.
- If you see errors about unreadable module directories, check that the `child` folder and its subfolders are present and named correctly.
- Run `terraform init` after any changes to module sources.

## License

MIT
