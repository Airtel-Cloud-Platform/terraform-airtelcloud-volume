variable "name" {
  description = "Volume name"

  type = string

  validation {
    condition     = length(trim(var.name, " ")) > 0
    error_message = "name cannot be empty."
  }
}

variable "size" {
  description = "Volume size in GB (50 to 4095)"

  type = number

  validation {
    condition     = var.size >= 50 && var.size <= 4095 && floor(var.size) == var.size
    error_message = "size must be a whole number between 50 and 4095 GB."
  }
}

variable "type" {
  description = "Volume tier. Accepts the API type name or the UI label (for example Standard Performance)."

  type = string

  validation {
    condition     = length(trim(var.type, " ")) > 0
    error_message = "type cannot be empty."
  }
}

variable "availability_zone" {
  description = "Availability zone (for example S1)"

  type = string

  validation {
    condition     = length(trim(var.availability_zone, " ")) > 0
    error_message = "availability_zone cannot be empty."
  }
}

variable "vpc_name" {
  description = "VPC name. Forces replacement if changed."

  type = string

  validation {
    condition     = length(trim(var.vpc_name, " ")) > 0
    error_message = "vpc_name cannot be empty."
  }
}

variable "subnet_name" {
  description = "Subnet name. Forces replacement if changed."

  type = string

  validation {
    condition     = length(trim(var.subnet_name, " ")) > 0
    error_message = "subnet_name cannot be empty."
  }
}

variable "compute_name" {
  description = "VM instance name to attach the volume to. Changing it detaches and re-attaches in place. Omit to leave the volume unattached."

  type    = string
  default = null
}

variable "labels" {
  description = "Optional labels for the volume. Applied after create and updated in place."

  type    = list(string)
  default = null
}

variable "is_encrypted" {
  description = "Enable volume encryption. Forces replacement if changed."

  type    = bool
  default = false
}

variable "bootable" {
  description = "Whether volume is bootable. Forces replacement if changed."

  type    = bool
  default = false
}

variable "enable_backup" {
  description = "Enable volume backup"

  type    = bool
  default = false
}
