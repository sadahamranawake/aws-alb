variable "AlbName" {
  type = string
}

variable "IsInternal" {
  type = bool
  default = false
}

variable "SecurityGroups" {
  type = set(string)
}

variable "SubnetIds" {
  type = set(string)
}

variable "EnableDeleteProtection" {
  type = bool
  default = false
}

variable "certificateArn" {
  type = string
}
