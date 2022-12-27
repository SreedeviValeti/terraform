terraform {

  backend "s3" {
    bucket  = "tf-remote-state-bkt"
    key     = "terraform/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }


  required_version = "= 1.1.7"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"

}

resource "aws_instance" "app_server_tf" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  subnet_id = "subnet-008c01****"
  tags = {
    Name = "dev_app_server"
  }
}
