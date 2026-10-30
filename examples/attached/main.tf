# Attach by VM name. Changing compute_name detaches the volume from the old
# instance and attaches it to the new one in place (no replacement).
module "volume" {
  source = "../../"

  name = "attached-volume"

  size = 50

  type = "s1_wkld_ntp02_4iops_backend"

  availability_zone = "S1"

  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"

  compute_name = "compute-name"
}

output "attached_to" {
  value = module.volume.attached_to
}

output "attachment_device" {
  value = module.volume.attachment_device
}
