resource "aws_instance" "web" {
  ami           = "ami-0bdb1d6c15a40392c"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]

  subnet_id = "${aws_subnet.public.id}"

  associate_public_ip_address = "true"

  key_name = "${var.KP}"

  user_data = "${data.template_file.userdata1.rendered}"

  iam_instance_profile = "${aws_iam_instance_profile.terraform_s3_policy.name}"

  tags {
    Name = "HelloWorld"
  }
}

output "ip" {
  value = "${aws_instance.web.public_ip}"
}

data "template_file" "userdata1" {
  template = "${file("shell/command.sh")}"
}
