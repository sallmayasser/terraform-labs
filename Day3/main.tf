module "my-network" {
  source  = "./network"
  subnets = var.subnet-list
  cidr    = var.vpc-cidr
  region  = var.aws-region

}
