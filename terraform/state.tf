terraform {
  backend "s3" {
    bucket = "surf66-terraform-state"
    key    = "sms_lambda.tfstate"
    region = "eu-west-2"
  }
}