terraform {
  backend "s3" {
    bucket = "harsh-bucket2812"
    key    = "state"
    region = "ap-south-1"
    dynamodb_table = "backend"
  }
}
