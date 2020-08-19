variable "account_id" {
  default = "123456789012"
}

variable "stack_name" {
    default = "aws-terraform-sample"
}

variable "deploy_role_arn"{
    default = "arn:aws:iam::123456789012:role/deployRole"
}

variable "s3bucket1" {
  default = "homesite-takehome-test-staging-54321"
}

variable "s3bucket2" {
  default = "homesite-takehome-test-raw-54321"
}

variable "s3bucket3" {
  default = "homesite-takehome-test-transformed-54321"
}
