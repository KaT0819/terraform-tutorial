variable "aws_access_key" {}
variable "aws_secret_key" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
#   shared_credentials_file = "$HOME/.aws/credentials"
#   profile                 = "terraform"
    region = "ap-northeast-1"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

resource "aws_instance" "app_server" {
#   ami           = "ami-830c94e3" # us-west-2 のAMI
  ami           = "ami-0a3d21ec6281df8cb"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
