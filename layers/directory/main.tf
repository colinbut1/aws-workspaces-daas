terraform {
  backend "s3" {}
}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 3"
}

data "aws_ssm_parameter" "simple_ad_admin_password" {
  name = "simple_ad_admin_password"
}

resource "aws_directory_service_directory" "ad_directory" {
  name     = var.simple_ad_name
  password = data.simple_ad_admin_password.value
  size     = "Small"

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.vpc_public_subnets
  }

}