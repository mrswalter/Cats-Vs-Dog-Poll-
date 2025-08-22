terraform {
  backend "s3" {
    bucket         = "state-storage-36"
    key            = "dev-poll/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "State-lock-36"
    #encrypt        = true
  }
}
