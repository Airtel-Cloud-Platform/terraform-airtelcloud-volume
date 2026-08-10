variable "name" {
  description = "Volume name"

  type = string

  validation {
    condition     = length(trim(var.name, " ")) > 0
    error_message = "name cannot be empty."
  }
}

variable "size" {
  description = "Volume size in GB"

  type = number

  validation {
    condition     = var.size >= 10
    error_message = "size must be at least 10 GB."
  }
}

variable "type" {
  description = "Volume type"

  type = string

  validation {
    condition     = length(trim(var.type, " ")) > 0
    error_message = "type cannot be empty."
  }
}

variable "availability_zone" {
  description = "Availability zone"

  type = string

  validation {
    condition     = length(trim(var.availability_zone, " ")) > 0
    error_message = "availability_zone cannot be empty."
  }
}

variable "vpc_name" {
  description = "VPC NAME"

  type = string

  validation {
    condition     = length(trim(var.vpc_name, " ")) > 0
    error_message = "vpc_name cannot be empty."
  }
}

variable "subnet_name" {
  description = "Subnet NAME"

  type = string

  validation {
    condition     = length(trim(var.subnet_name, " ")) > 0
    error_message = "subnet_name cannot be empty."
  }
}

variable "compute_name" {
  description = "Compute instance NAME"

  type    = string
  default = null
}

variable "is_encrypted" {
  description = "Enable volume encryption"

  type    = bool
  default = false
}

variable "bootable" {
  description = "Whether volume is bootable"

  type    = bool
  default = false
}

variable "enable_backup" {
  description = "Enable volume backup"

  type    = bool
  default = false
}
