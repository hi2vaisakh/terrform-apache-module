variable "ami_id" {
  description = "The ID of the AMI to run in the apache24. This should be an AMI built from the Packer template under packer/apache24/apache24.json."
  type        = string
  default     = null
}

variable "ssh_key_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instance. Set to an empty string to not associate a Key Pair."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of the Subnet in which the inatnce will be deployed."
  type        = string
  default     = null
}

variable "user_data"{
  type = string
  default = null
}

variable "instance_type"{
  type =string
  default = null
}
