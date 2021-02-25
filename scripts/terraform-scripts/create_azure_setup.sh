#!/bin/bash
# Script adapted from https://docs.microsoft.com/en-us/azure/terraform/terraform-backend.
# We cannot create this storage account and blob container using Terraform itself since
# We are creating the remote state storage for Terraform and Terraform needs this storage in terraform init phase.
# We are also creating the Azure Container Registry to store the icap images.

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $REGION --tags $TAGS

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob --tags $TAGS

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

az keyvault create --name $VAULT_NAME --resource-group $RESOURCE_GROUP_NAME --location $REGION

az keyvault secret set --vault-name $VAULT_NAME --name terraform-backend-key --value $ACCOUNT_KEY

# Create ACR
az acr create --resource-group $RESOURCE_GROUP_NAME --name $CONTAINER_REGISTRY_NAME --sku Premium

echo "resource group": $RESOURCE_GROUP_NAME
echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"
echo "keyVault": $VAULT_NAME
echo "container_registry: $CONTAINER_REGISTRY_NAME"

unique=$(uuidgen)
cat <<EOF >backend.tfvars
resource_group_name  = "${RESOURCE_GROUP_NAME}"
storage_account_name = "${STORAGE_ACCOUNT_NAME}"
container_name       = "${CONTAINER_NAME}"
key                  = "${unique}.gw.delivery.terraform.tfstate"
EOF

cat <<EOF >terraform.tfvars
azure_region           = "UKWEST"
suffix                 = "mp1"

domain                 = "ukwest.cloudapp.azure.com"

icap_port              = 1344
icap_tlsport           = 1345

enable_customer_cert   = false
acr_name               = $CONTAINER_REGISTRY_NAME
EOF