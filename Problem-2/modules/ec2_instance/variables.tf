variable "ami" {
  description = "The AMI to use for the instance."
}

variable "instance_type" {
  description = "The type of instance to create."
}

variable "security_group_id" {
  description = "The security group ID to associate with the instance."
}

variable "instance_name" {
  description = "The name tag for the instance."
}
