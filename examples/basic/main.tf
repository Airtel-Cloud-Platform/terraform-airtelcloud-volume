module "volume" {
  source = "../../"

  name = "data-volume"

  size = 50

  type = "s1_wkld_ntp02_4iops_backend"

  availability_zone = "S1"

  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"
}

output "volume_id" {
  value = module.volume.volume_id
}
