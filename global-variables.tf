variable "aws_region" {
  description       = "AWS EC2 Region for the DEV VPC."
  default           = "ap-southeast-1"
}

variable "s3_bucket" {
    description     = "S3 bucket"
    default         = "scb-terraform-state"
}

variable "file_state" {
    description     = "Terraform file state"
    default         = "terraform.tfstate"
}


variable "lz_vpc" {
    description     = "CIDR block for subnet LZ-VPC."
    default         = "192.168.0.0/24"
}

variable "lz_pub_sbn_1a" {
    description     = "CIDR block for subnet Lz-Pub-Subnet-1a."
    default         = "192.168.0.0/27"
}

variable "lz_pub_sbn_1b" {
    description     = "CIDR block for subnet Lz-Pub-Subnet-1b."
    default         = "192.168.0.32/27"
}