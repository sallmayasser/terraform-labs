terraform {
  backend "s3" {
    bucket = "terraform-lab1-statefile"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}

