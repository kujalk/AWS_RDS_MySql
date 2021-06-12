1. Fill up the values in following files,
- provider.tf
- Terraform.tfvars

2. Give the Terraform commands
terraform init
terraform plan
terraform apply

3. Output of Terraform template will be 
- rds url

4. To delete the resources,
-terraform destroy

Notes
---------
- 2 subnets with differnet availability zone is created to be attached with RDS which is a pre-requisite
- Subnets created without any public IPs support
- Ingress traffic is allowed only in port 3306 TCP from the VPC subnet address range while eggress traffic is allowed everywhere

Developer - K.Janarthanan