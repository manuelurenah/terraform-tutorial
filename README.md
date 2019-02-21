# Terraform Tutorial

Simple tutorial to setup a web server in AWS using Terraform for Infrastructure orchestration.

## Setup

First install Terraform CLI

```bash
brew update
brew install terraform
```

Verify the installation with the following command

```bash
terraform --version
# Terraform v0.11.11
```

Then, get the providers from Terraform

```bash
terraform init
```

## Configuration

Make sure you have an AWS account up and running to test out this repo. Create an [IAM](https://console.aws.amazon.com/iam/home?region=us-east-1#/users$new?step=details) user in order to get your AWS access and secret keys. With those keys, head over to your home directory and modify your shell profile to export them

```bash
export AWS_ACCESS_KEY_ID=<aws_access_key>
export AWS_SECRET_ACCESS_KEY=<aws_secret_key>
```

## Getting Dirty

Once you have configured your AWS account and retrieved the access and secret keys, it's time to show what Terraform is all about.

Use the following command to check what is going to be deployed

```bash
terraform plan
```

And to actually provision your infrastructure into the real world we use the `apply` command

```bash
terraform apply # we can optionally set the vars with -var server_port=8081
```
