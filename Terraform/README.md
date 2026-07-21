# Terraform

> [Course URL](https://www.youtube.com/watch?v=7xngnjfIlK4&pp=ygUTc2lkIHBhbGFzIHRlcnJhZm9ybQ%3D%3D)

## Setup

- Install terraform using winget
- Install aws cli using winget
- Configure AWS CLI using `aws configure` enter access key id secret, region etc
- This info is saved in users home directory /.aws/crednetials file
- `aws configure help` to get info on aws configure `aws configure list` to list the configurations

## Commands

- `terraform init`
- `terraform plan`
- `terraform apply`
- `terraform destroy`
- `terraform show` to see the current plan
- `terraform validate`

## State file

- When we run the terraform plan/apply the state file gets created in the local directory itself.
- This is not a good way to store the state file if multiple teams are working on the same set of terraform code.
- We can use S3 bucket to store the state file. This is called remote state storage. This is the best way to store the state file.
- We can also use the dynamo db table to lock the state file. This is to avoid multiple users from modifying the state file at the same time. This is called state locking.


## Setup backend in S3 bucket and dynamo db table for state locking and remote state storage.

- See the 01awsbackend directory for the code.
- Run the `terraform init` command to initialize the backend.
- Run the `terraform plan` and then `terraform apply` command to create the S3 bucket and dynamo db table.
- Uncomment the backend block in the main.tf file and run the `terraform init` command to initialize the backend.
- Now we can use the S3 bucket and dynamo db table for remote state storage and state locking.
- In the subsequent folders we will be using this s3 backend to store state file
- The key in the backend s3 should be unique to each main.tf file otherwise when we apply the file will get overriden in the s3 bucket

## Workspace

- `terraform init`
- `terraform workspace list`
- `terraform workspace new dev` it will select the newly created workspace dev
- `terraform workspace -h` To see terraform worksapce options type 