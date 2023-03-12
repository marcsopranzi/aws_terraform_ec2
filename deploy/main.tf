terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = var.project
    Onwer       = var.contact
    ManagedBy   = "Terraform"
  }
}

data "aws_region" "current" {}