terraform {
  backend "s3" {
    bucket = "bulk-email-with-ai-content-creator-terraform-state"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
