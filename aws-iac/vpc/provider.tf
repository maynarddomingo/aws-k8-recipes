terraform {
  backend "s3" {
    bucket = "nricoyanaws2024"
    key    = "my-terraform-learning"
    region = "us-east-1"
    //    shared_credentials_file = "~/.aws/credentials"
  }
}

provider "aws" {
  region = "us-east-1"
  //  shared_credentials_file = "~/.aws/credentials"
}
