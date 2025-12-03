# Full automation: creates vm code with environment (dev/prod) and modules, 
# and writes provider.tf with features{} and subscription_id.

$root = "vm code"

# Provider content (use single-quoted here-string to avoid interpolation)
$providerContent = @'
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "e18988e4-e1f4-4f06-9339-c63c8a22d3d9"
}
'@

# --- ENVIRONMENT SETUP ---
$envRoot = Join-Path $root "environment"
$envs = @("dev", "prod")
$envFiles = @(
    ".terraform.lock.hcl",
    "main.tf",
    "output.tf",
    "provider.tf",
    "terraform.tfvars",
    "variables.tf"
)

# Create root and environment folder
New-Item -ItemType Directory -Path $root -Force | Out-Null
New-Item -ItemType Directory -Path $envRoot -Force | Out-Null

foreach ($env in $envs) {
    $envPath = Join-Path $envRoot $env
    New-Item -ItemType Directory -Path $envPath -Force | Out-Null

    foreach ($file in $envFiles) {
        $filePath = Join-Path $envPath $file
        # Create empty file (or overwrite)
        New-Item -ItemType File -Path $filePath -Force | Out-Null
    }

    # Overwrite provider.tf with the desired content
    $providerPath = Join-Path $envPath "provider.tf"
    $providerContent | Out-File -FilePath $providerPath -Encoding utf8 -Force
}

# --- MODULES SETUP ---
$modulesRoot = Join-Path $root "modules"

$modules = @{
    "azurerm_key_vault"          = @("main.tf", "variables.tf")
    "azurerm_key_vault_secret"   = @("main.tf", "variable.tf")
    "azurerm_public_ip"          = @("main.tf", "variables.tf")
    "azurerm_resource_group"     = @("main.tf", "variables.tf")
    "azurerm_sql_database"       = @("main.tf", "variables.tf")
    "azurerm_sql_server"         = @("main.tf", "variables.tf")
    "azurerm_subnet"             = @("main.tf", "variables.tf")
    "azurerm_virtual_machine"    = @("data.tf", "main.tf", "variables.tf")
    "azurerm_virtual_network"    = @("main.tf", "variables.tf")
}

New-Item -ItemType Directory -Path $modulesRoot -Force | Out-Null

foreach ($module in $modules.Keys) {
    $modulePath = Join-Path $modulesRoot $module
    New-Item -ItemType Directory -Path $modulePath -Force | Out-Null

    foreach ($file in $modules[$module]) {
        $filePath = Join-Path $modulePath $file
        New-Item -ItemType File -Path $filePath -Force | Out-Null
    }
}

Write-Host "Done. Full project skeleton created at '$root'. Provider files updated with subscription_id."
