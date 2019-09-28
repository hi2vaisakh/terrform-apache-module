terraform {
  required_version = ">=0.12"
}

provider "aws"{
  region = "eu-west-1"
}

data "aws_ami" "apache"{

  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

}

data "template_file" "user_data_apache24"{

  template = file("${path.module}/user-data/scripts/user-data-apache24.sh")
}

data "aws_vpc" "default_vpc"{

  id = var.vpc_id

}

data "aws_subnet_ids" "default_subnet_id"{

vpc_id = data.aws_vpc.default_vpc.id

}

data "aws_region" "current"{
}

module "apache_instance"{

source = "./modules/apache-instance"

instance_type = "t2.micro"

ami_id    = "${var.ami_id == null ? data.aws_ami.apache.image_id : var.ami_id}"
user_data = "${data.template_file.user_data_apache24.rendered}"

subnet_id = "${element(tolist(data.aws_subnet_ids.default_subnet_id.ids), 0)}"

ssh_key_name                = var.ssh_key_name

}
