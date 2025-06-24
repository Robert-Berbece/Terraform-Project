terraform {
  backend "s3" {
    bucket         = "s3-robertp-terraform-state-bucket" 
    key            = "episode2/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
