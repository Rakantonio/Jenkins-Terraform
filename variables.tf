variable "region" {
  type = string
  description = "AWS region"
  default = "eu-west-3" 
}

variable "instance_name" {
  type = string
  default = "antonio_instance"
}

variable "key_name" {
  type = string
  default = "cours_ynov"
} 

variable "resource_name" {
  type = string
  default = "antonio_SSH"
  description = "Allow ssh inbound traffic"
}
