resource "aws_s3_bucket" "bucket_to_store_tfstate" {
  bucket = "banuka-terraform-backend-tfstate"


  force_destroy = true
  tags = {
      Name = "created by tf"
  }
}
