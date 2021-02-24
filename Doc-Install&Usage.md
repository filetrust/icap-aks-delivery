# Installation and setting up the environment
- [1. Pre-requisites](#1-pre-requisites)
  * [1.1 Installation of Pre-requisites](#11-installation-of-pre-requisites)
  * [Terraform install](#terraform-install)
  * [Kubectl install](#kubectl-install)
  * [Helm install](#helm-install)
  * [Open SSL](#open-ssl)
  * [Azure CLI](#azure-cli)
  * [JSON processor](#json-processor)
  * [Git](#git)
  * [Azure Subscription Pre Requisite](#azure-subscription-pre-requisite)
  * [Inputs](#inputs)
- [2. Set up the environment](#2-set-up-the-environment)
  * [2.1 Clone Repo.](#21-clone-repo)
  * [Pre-requisite healthcheck.](#pre-requisite-healthcheck)
  * [2.2 Firstly make sure you are logged in and using the correct subscription.](#22-firstly-make-sure-you-are-logged-in-and-using-the-correct-subscription)
  * [2.3. Add required credentails.](#23-add-required-credentails)
  * [2.4 Create azure initial setup](#24-create-azure-initial-setup)
  * [2.5 Add Terraform Backend Key to Environment](#25-add-terraform-backend-key-to-environment)
  * [2.6 Azure setup Healthcheck](#26-azure-setup-healthcheck)
  * [2.7 Add Secrets to main KeyVault](#27-add-secrets-to-main-keyvault)
  * [2.8 File Modifications](#28-file-modifications)
- [3 Creating SSL Certs](#3-creating-ssl-certs)
    + [Self signed quick start](#self-signed-quick-start)
    + [Customer Certificates](#customer-certificates)
- [4 Pre-deployment](#4-pre-deployment)
## 1. Pre-requisites
- Terraform 
- Kubectl
- Helm
- Openssl
- Azure CLI 
- Bash terminal or terminal able to execute bash scripts
- JSON processor (jq)
- Git
- Microsoft account
- Azure Subscription
- Dockerhub account 

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| kubectl | ~> 1.19 |
| helm | ~> 3.4 |
| az cli | ~> 2.17 |
| jq | ~> 1.6 |
| Openssl | ~> 1.1 |
| git | ~> 2.27.0 |

### 1.1 Installation of Pre-requisites
### Terraform install

**MacOS**

1. Install terraform by running

    ```
    brew install terraform
    ```

2. Confirm version

    ```
    terraform -version
    ```
 
**Windows**

1. Download the terraform package from portal either 32/64 bit version.
2. Make a folder in C drive in program files if its 32 bit package you have to create folder inside on programs(x86) folder or else inside programs(64 bit) folder.
3. Extract a downloaded file in this location or copy terraform.exe file into this folder. copy this path location like C:\Programfile\terraform\
4. Then goto 
    ```
    
    Control Panel -> System -> System settings -> Environment Variables
    Open system variables, select the path > edit > new > place the terraform.exe file location like > C:\Programfile\terraform\ and Save it.
    
    ```
5. Open new terminal and now check the terraform.
 
    ```   
        --With Chocolatey run
         choco install terraform
    ```

**Linux**

1. Copy and paste the following command:
    ```
            $ sudo yum install -y yum-utils
            $ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
            $ sudo yum -y install terraform
     ```
2. Confirm installation was successful by verifying its version.
    ```
            $ terraform --version
            Terraform v0.14.3
    ```
 
### Kubectl install
**MacOS**

- Copy and paste the following command
    ```
     brew install kubectl 
    ```
 
**Windows**

1. To install kubectl on Windows you can use Chocolatey package manager 
    ```
    choco install kubernetes-cli
    ```
2. Test to ensure the version you installed is up-to-date:
    
    ```
    kubectl version --client
    ```
3. Navigate to your home directory:

    ```
    # If you're using cmd.exe, run: cd %USERPROFILE%
    cd ~
    ```
4. Create the .kube directory:
    ```
     mkdir .kube
    ```
5. Change to the .kube directory you just created:
    ```
    cd .kube
    ```
6. Configure kubectl to use a remote Kubernetes cluster:

     `New-Item config -type file`
     
**Linux**

1. Download the latest release with the command
    ```
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    ```
 
2. Install kubectl
    ```
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    ```
3. Confirm the version is up to date
    ```
    kubectl version –client
    ```
    
### Helm install

**MacOS**
- Copy and paste the following command
```
brew install helm
 ```
 
**Windows**
- Run the following command with chocolatey
```
choco install kubernetes-helm
```

**Linux**
- Copy and paste the following commands
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
### Open SSL 

**MacOS**  
- Run the following command
```
brew info openssl

#check version
openssl version -a
```
**Windows**

Follow the instructions [here](https://www.xolphin.com/support/OpenSSL/OpenSSL_-_Installation_under_Windows)

**Linux**

- Run the following commands
```
 #check openssl version
 openssl version
 #if version is < 1.1.1h run below steps
 cd ~
 wget https://www.openssl.org/source/openssl-1.1.1h.tar.gz
 tar -xzf openssl-1.1.1h.tar.gz
 cd openssl-1.1.1h
 ./config
 sudo yum install -y make
 sudo yum install -y gcc
 make
 sudo make install
 sudo rm -i -y /usr/bin/openssl
 sudo ln -s /usr/local/bin/openssl /usr/bin/openssl
 ```

### Azure CLI

**MacOS**
- Copy and paste the following command
```
brew update && brew install azure-cli
```
**Windows**
- Follow instructions in [this link](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

**Linux**
- Copy and paste the following commands
```
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
$ sudo yum install -y azure-cli
# check version
$ az --version
```
### JSON processor

**MacOS**
- Run
```
brew install jq

```
**Windows**
- Run
```
chocolatey install jq
```

**Linux**
- Run
```
wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
chmod +x ./jq
sudo cp jq /usr/bin
# check version
jq --version
```

### GIT

**MacOS**
- Run
```
brew install git

```
**Windows**
- Run
```
chocolatey install git
```

**Linux**
- Run
```
sudo yum install -y git
# check version
git --version
```
### Azure Subscription Pre Requisite


- There should be atleast one subscription associated to azure account
- The subscription should have **Contributor** role which allows user to create and manage virtual machines
- This documentation will provision a managed Azure Kubernetes (AKS) cluster on which to deploy the application. 
- This cluster has configured to auto scaling and  runs on a minimum of 4 nodes and maximum of 100 nodes.
- The specification of the nodes is defined in the `modules/aks01` configuration of this deployment
- The default configuration is to run 4 nodes of which will consume one virtual CPU’s (vCPU) of  type **Standard_DS4_v2** type anf **100 gb** on disk size  -
- The total amount of vCPU available in an Azure region is determined by the subscription itself.
- When deploying, it is essential to ensure that there is enough vCPU available within your subscription to provision the node type and count specified.
  

### Inputs

These are the variables required for the deployment

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_region | The cloud region | `string` | n/a | yes |
| suffix | Short Suffix used for cluster names | `string` | n/a | yes |
| DH_SA_USERNAME| Dockerhub username | `string` | n/a | yes |
| DH_SA_PASSWORD| Dockerhub password | `string` | n/a | yes |
| SmtpUser | SMTP Username | `string` | n/a | yes |
| SmtpPass | SMTP Password | `string` | n/a | yes |
| SmtpHost|  SMTP Host | `string` | smtp.office365.com | yes |
| SmtpPort | SMTP Port | `string` | 587 | yes |
| SmtpSecureSocketOptions | SMTP Secure Socket Options | `string` | StartTls | yes |
| RESOURCE_GROUP_NAME | Resource group name for initial azure setup | `string` | n/a | yes |
| STORAGE_ACCOUNT_NAME | Storage account name for initial azure setup | `string` | n/a | yes |
| CONTAINER_NAME | Container Name for initial azure setup | `string` | n/a | yes |
| VAULT_NAME | Vault Name for initial azure setup | `string` | n/a | yes |
| key | state key name for terraform | `string` | n/a | yes |

## 2. Set up the environment

### 2.1 Clone Repo.

```
git clone https://github.com/k8-proxy/icap-aks-delivery.git
cd icap-aks-delivery
git submodule init
git submodule update

```
### Pre-requisite healthcheck.

```
./scripts/healthchecks/pre_requisite_healtcheck.sh

```
   
### 2.2 Firstly make sure you are logged in and using the correct subscription.

```bash

az login

az account list --output table

az account set -s <subscription ID>

# Confirm you are on correct subscription
az account show

```

### 2.3. Add required credentails.

- All the required secrets and variables are listed in ".env.example".

- Run below

```
cp .env.example .env

vim .env
```

- Enter required values for all variables in the same format as default value
```
(REGION - any Azure region
RESOURCE_GROUP_NAME, STORAGE_ACCOUNT_NAME - accepts just small letters and numbers,
CONTAINER_NAME, TAGS, VAULT_NAME, DH_SA_USERNAME, DH_SA_PASSWORD, SmtpUser, SmtpPass, token_username="policy-management")
```
- Run
```
export $(xargs<.env)
```
### 2.4 Create azure initial setup

- Run below script

```     
./scripts/terraform-scripts/create_azure_setup.sh

```

### 2.5 Add Terraform Backend Key to Environment

- Check if you have access to keyvault using below command
```
az keyvault secret show --name terraform-backend-key --vault-name $VAULT_NAME --query value -o tsv
```
- Export the environment variable "ARM_ACCESS_KEY" to be able to initialise terraform

```
export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name $VAULT_NAME --query value -o tsv)
```
 
- Check if you can access it through variable
```
echo $ARM_ACCESS_KEY
```

### 2.6 Azure setup Healthcheck 

```
./scripts/healthchecks/azure_setup_healthcheck.sh

```

### 2.7 Add Secrets to main KeyVault 

- Run below script

```
./scripts/terraform-scripts/load_keyvault_secrets.sh
```
- In case setup healthcheck returns any errors, fix them before proceeding

### 2.8 File Modifications


- Edit backend.tfvars running below script - this will be used as azure backend to store deployment state 
```
./scripts/terraform-scripts/setup_backend_config.sh
```
- Edit terraform.tfvars

```
vim terraform.tfvars

# give a valid region name
azure_region="UKWEST"

# give a short suffix, maximum of 3 character.
suffix="stg"

```

### 3 Creating SSL Certs

#### Self signed quick start

**For evaluation use we have provided scripts to generate and apply self signed certificates**

- Open terraform.tfvars
```
vim terraform.tfvars

```
- Set flag `enable_cutomser_cert` as `false`. The self signed cdertificate will be generated and configured automatically during deployment.

#### Customer Certificates

**If you have your own certificates for production use then follow below steps**
- Run below
```
mkdir -p certs/mgmt-cert
mkdir -p certs/icap-cert
mkdir -p certs/file-drop-cert
```
- There will be three set of certificates needed. Please follow below procedure 

- Replace suffix in below domain names while generating actual certificates for domains. You should be having three set of certificates once generating certificates.

|  Name         | Domain Name |
|------         |---------    |
| icap-client   | icap-${suffix}.ukwest.cloudapp.azure.com   |
| management-ui | management-ui-${suffix}.{domain} |
| file-drop     | file-drop-${suffix}.{domain}     |

- Rename `.crt` file to certificate.crt and `.key` file to `tls.key` for all domain certificates

- Copy `icap-client certificates` to `certs/icap-cert`

- Copy `file-drop certificates` to  `certs/file-drop-cert`

- Copy `management-ui certificates` to  `certs/mgmt-cert`

- Set flag `enable_cutomser_cert` to `true` in `terraform.tfvars` which takes above certificate during deployment

## 4. Pre deployment

### ICAP Port customization
- By default icap-server will run on port 1344 for SSL and 1345 for TLS
- If you want to customize the above port, please follow below procedure
```
vim terraform.tfvars
```
- Edit variables `icap_port` and `icap_tlsport` according to requirement and Save it.

Note : Please avoide port 80, 443 since this will be used for file-drop UI.

[Go to top](#installation-and-setting-up-the-environment)
