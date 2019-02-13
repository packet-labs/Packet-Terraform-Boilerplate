# Packet-Terraform-Project-Boilerplate

This repo was designed to get you up and running quickly with Terraform and Packet. Terraform allows you to define
your infrastructure as code and then easily deploy it across the Packet bare metal cloud. This set of sample
Terraform configuration files deploys two web servers bare metal hosts. Feel free to clone this repo and then use 
it as the base for your own project.


## Install Terraform

This repo utilizes Terraform to deploy the bare metal infrastructure. The following instructions
walk through installing Terraform on a local host. This local host can be any system (VM or physical host)
that supports Terraform (macOS, FreeBSD, Linux, OpenBSD, Solaris, and Windows).

https://learn.hashicorp.com/terraform/getting-started/install.html#installing-terraform

These instructions have only been validated on Linux however.

## Install Git

This codebase is available on GitHub and can be downloaded using the Git tools. The following
instructions walk through installing Git on a local host.

https://git-scm.com/downloads

## Download this Repo

```
git clone https://github.com/packet-labs/Packet-Terraform-Project-Boilerplate
```

## Setup the local variable overrides file

Copy over a blank Terraform variable file. This file allows any of the default
values in variables.tf to be overridden. By default, you won't need to make any 
changes to this file.

```bash
cp terraform.tfvars.sample terraform.tfvars
```

## Setup any keys

By default, this repo will utilize the SSH key at ~/.ssh/id_rsa. An alternate public and private key
file can be defined in terraform.tfvars. This key should not already be setup in the Packet project.

## Setup a Packet Host account

The bare metal hosts will be deployed across the Packet bare metal cloud. This requires an account
with [Packet](https://www.packet.com). A Packet project id and
API authentication token are required in order for Terraform to communicate to Packet and provision
the infrastructure. 
To find these values see [Packet API Integration](https://support.packet.com/kb/articles/api-integrations)

These two values can be set as environment variables, saved in the terraform.tfvars, or entered
when Terraform is run. By default, terraform.tfvars is setup in .gitignore so your secret keys
are not checked into source control.

Setting environment variables:
```bash
export TF_VAR_packet_auth_token="ABCDEFGHIJKLMNOPQRSTUVWXYZ123456"
export TF_VAR_packet_project_id="12345678-90AB-CDEF-GHIJ-KLMNOPQRSTUV"
```

## Deploy the infrastructure

The following commands will setup any necessary Terraform plugins and proceed with the deployment.
By default, two webservers will be deployed each with a webserver running on port 80.

```bash
terraform init
terraform plan
terraform apply
```

When the deployment finishes, the public IP addresses of the hosts will be displayed.

Testing HTTP:
```bash
curl <IP address of web server>
```

Accessing via SSH:
```bash
ssh root@<IP address>
```

Accessing via SSH if an alternate key was setup:
```bash
ssh root@<IP address> -i <path and filename to alternate private key>
```

## Teardown the infrastructure

The following command will tear down all deployed infrastructure. All bare metal hosts will be
deallocated from the account and wiped/reimaged. Destroying the infrastructure will stop any
charges from accruing.

```bash
terraform destroy
```
