terraform {
  backend "s3" {
    bucket = "terraform-s"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}