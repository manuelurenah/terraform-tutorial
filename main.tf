provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "neka" {
  ami                    = "ami-2d39803a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.nofi.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, Neka" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags {
    Name = "terraform-neka"
  }
}

resource "aws_security_group" "nofi" {
  name = "terraform-nofi-instance"

  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

output "public_ip" {
  value = "${aws_instance.neka.public_ip}"
}
