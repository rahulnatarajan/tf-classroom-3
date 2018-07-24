provider "aws" {
  region = "ap-southeast-1"
}


module "vpc_lzone" {
  source          = "./vpc"
  lz_vpc         = "${var.lz_vpc}"
  lz_pub_sbn_1a  = "${var.lz_pub_sbn_1a}"
  lz_pub_sbn_1b  = "${var.lz_pub_sbn_1b}"
} 