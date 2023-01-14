

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAWQHQ3XCLMB2OL5TN"
  secret_key = "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"
}

resource "aws_instance" "ubuntu" {
  ami =   "ami-06878d265978313ca"
  count = 1
  instance_type = "t2.micro"

  tags = {
     name = "myfirstinstance"

  }
}

resource "aws_security_group" "security_jenkins_port" {
  name = "security_jenkins_port"
  description = "SG for jenkins"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    tags= {
    name= "security_jenkins_group"
  }
}
}

