provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "banuka-terraform-test" {  
  bucket = "banuka-terraform-test"  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

terraform {
    backend "s3"{
       bucket = "banuka-terraform-test"
       key = "put/here/terraform.tfstate"
    }
}



