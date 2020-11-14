terraform {
  backend "s3" {
    profile        = "terraform-state"
    bucket         = "btower-labz-terraform"
    key            = "emirates/aws-eks-reference.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    kms_key_id     = "arn:aws:kms:eu-west-2:725949405513:key/486db860-5d4b-4ebe-8b7a-8d1c4c71a65e"
    dynamodb_table = "terraform"
  }
}
