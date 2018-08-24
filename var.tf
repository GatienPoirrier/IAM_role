
variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  region     = "${var.region}"
}


variable "private_key" {
  default = "myTerraKP"
}
