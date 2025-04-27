variable "aws-region" {
  type    = string
  default = ""
}

variable "availability-zone-1" {
  type    = string
  default = ""
}
variable "availability-zone-2" {
  type    = string
  default = ""
}
variable "vpc-cidr" {
  type = string
  default = ""
}
variable "ami-image" {
  type    = string
  default = ""
}

variable "free-instance-type" {
  type    = string
  default = ""
}

variable "subnet-list" {
  type = list(object({
    name = string
    cidr = string
    az   = string
    type = string
  }))
  default = [
    {
      name = ""
      cidr = ""
      az   = ""
      type = ""
    }
  ]
}

variable "state_bucket_id" {
 type =  string
 default = "terraform-lab1-statefile"
}