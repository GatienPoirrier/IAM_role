
variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  region     = "${var.region}"
}


variable "KP" {
  default = "~/Document/Engie/aws/SecuAWS/myTerraKP"
}
