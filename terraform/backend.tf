
terraform {
  backend "s3" {
    bucket = "sagar-project-terraform-state-bucket"
    key    = "project/state.tfstate"
    region = "us-east-1"
  }
}
