terraform {
  required_version = ">= 0.12"
}

provider "aws"{
  region = "eu-west-1"
}
resource "aws_instance" "apache24"{

  ami           = var.ami_id
  key_name = var.ssh_key_name
  subnet_id = var.subnet_id
  user_data = var.user_data
  instance_type = var.instance_type

  tags = {
    Name = "apche24"
  }

}
