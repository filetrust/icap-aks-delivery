# Push Images Script


## Overview

The purpose of this script is to push the images required for the icap service to the newly created Azure Container Registry during the Terraform Deployment.

You will need the ```_images.tgz``` package that will be provided by Glasswall Solutions which has all the images within. The script will then unpack the images and push them to the container registry that is parsed into the execution of the script.

### How to use the script

Firstly please make sure you have the ```_images.tgz``` tarball within the following directory ```./scripts/push-images```. You will also need to make sure you know the name of the ACR that was created during the Terraform deployment, it should follow the following structure ```aksacr<suffix>```.

Next you will need to run the following:

```bash
./scripts/push-images/push_images.sh <NAME OF ACR>
```

This script can take a while to complete as it is uploading all the images to the ACR you specified. The time depends on your internet connection but sometimes it's upwards of one hour.