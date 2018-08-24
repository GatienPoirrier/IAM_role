variable "access_key" {
  default = "AKIAII4FY56G7A2FQI5Q"
}

variable "secret_key" {
  default = "hRc2Ov5XI1UZW3wLAYtNgDfhog3/jUz6UXL0EivK"
}

variable "region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}


variable "private_key" {
  default = "MyGuruKP"
}
