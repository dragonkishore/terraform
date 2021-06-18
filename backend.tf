terraform {
  backend "s3" {
    bucket = "terraform-s"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}