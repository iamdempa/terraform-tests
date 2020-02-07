terraform {
    backend "s3" {
        bucket = "banuka-terraform-backend-tfstate"
        key = "terraform/terraform.tfstate"
        region = "us-east-1"
    }
}