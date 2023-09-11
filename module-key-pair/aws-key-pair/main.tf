# configure aws provider

provider "aws" {
  region = var.region
  }

module "aws_key_pair" {
  source     = "../modules/key-pair"
  key_pairs  = var.key_pairs
}


