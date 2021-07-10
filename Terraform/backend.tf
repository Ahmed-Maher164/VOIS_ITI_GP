terraform {
  backend "s3" {
      bucket = "vois-iti-gp"
      key = "iti/terraform.tfstate"
      region = "eu-central-1"
      dynamodb_table ="backend"
  }
}
