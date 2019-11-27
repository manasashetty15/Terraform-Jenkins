provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami  = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"

tags  = {
  Name  = "example"
}

lifecycle {
  create_before_destroy = "false"
}

}

output "instance_ips" {
  value = ["${aws_instance.example.*.public_ip}"]
}
