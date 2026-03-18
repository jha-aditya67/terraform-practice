terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws" 
            version = "6.36.0"
        }
    }
    backend "s3" {
        bucket = "dh-state-bucket"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "state-remote-table"
    }
}