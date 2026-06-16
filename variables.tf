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

variable "vpc_id" {
  description = "VPC ID"

  type = string

  validation {
    condition     = length(trim(var.vpc_id, " ")) > 0
    error_message = "vpc_id cannot be empty."
  }
}

variable "subnet_id" {
  description = "Subnet ID"

  type = string

  validation {
    condition     = length(trim(var.subnet_id, " ")) > 0
    error_message = "subnet_id cannot be empty."
  }
}

variable "compute_id" {
  description = "Compute instance ID"

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
