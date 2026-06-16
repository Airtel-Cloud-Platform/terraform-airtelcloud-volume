module "volume" {
  source = "Airtel-Cloud-Platform/volume/airtelcloud"

  name = "application-data-volume"

  size = 100

  type = "s1_wkld_ntp02_4iops_backend"

  availability_zone = "S1"

  vpc_id    = "vpc-id"
  subnet_id = "subnet-id"

  compute_id = "compute-id"

  is_encrypted = true

  bootable = false

  enable_backup = true
}
