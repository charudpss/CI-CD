# Stack Name
variable "cluster_name" {
  type = string
  default = "EKS_CLOUD"
}

# Worker Node instance size
variable "instance_size" {
  type = string
  default = "t2.medium"
}

# Region
variable "region" {
  type = string
  default = "us-east-1"
}

# SSH Access
variable "ssh_access" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

# UI Access
variable "http_access" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

# Environment
variable "env" {
  type    = string
  default = "Prod"
}

# Type
variable "type" {
  type    = string
  default = "Production"
}

# Instance count
variable "instance_count" {
  type = string
  default = 2
}
