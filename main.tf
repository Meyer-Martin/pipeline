terraform{
  backend "s3" {}
  }

provider "aws" {
  region     = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count         = var.create_instance ? var.instance_number : 0
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name   = "tp_dev_ynov"
  tags = {
    Name = "instance_jenkins_server_martin"
  }
}


resource "aws_security_group" "security_group" {
  name = "instance_terraform_meyer" 
  description = "STP FONCTIONNE"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"

}
  }
