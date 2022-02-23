terraform {
  required_version  = ">= 0.1.0.7"
  backend "s3" {
    bucket         = "form3-terraform-remote-state"
    key            = "eu-west-1/staging/account/terraform.tfstate"
    encrypt        = "true"
    region         = "eu-west-1"
    dynamodb_table = "terraform_state"
  }
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
    vault = {
      version = "3.0.1"
    }
  }
}

provider "vault" {
  address = "http://localhost:8201"
  token   = var.vault_token
}
