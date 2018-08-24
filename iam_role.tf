resource "aws_iam_role" "s3_role" {
  name = "s3_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_instance_profile" "terraform_s3_policy" {
  name = "terraform_s3_policy"
  role = "${aws_iam_role.s3_role.name}"
}

resource "aws_iam_policy" "policy" {
  name        = "terraform_s3_policy"
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.s3_role.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
