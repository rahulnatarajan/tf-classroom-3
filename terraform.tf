terraform {
 backend "s3" {
 encrypt        = true
 bucket         = "scbdemo"
 region         = "ap-southeast-1"
 key            = "terraform.tfstate"
 }
}