# Changing is_encrypted, bootable, vpc_name or subnet_name forces replacement.
module "volume" {
  source = "../../"

  name = "encrypted-volume"

  size = 50

  type = "Standard Performance"

  availability_zone = "S1"

  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"

  is_encrypted  = true
  enable_backup = true
}

output "volume_status" {
  value = module.volume.volume_status
}
