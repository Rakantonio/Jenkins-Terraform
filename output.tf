output "instance_ip_addr" {
  value = aws_instance.instance_ynov.public_ip
  description = "The pubic IP address of the main server instance"
}
