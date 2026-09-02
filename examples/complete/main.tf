module "volume" {
  source = "Airtel-Cloud-Platform/volume/airtelcloud"

  name = "application-data-volume"

  size = 100

  type = "s1_wkld_ntp02_4iops_backend"

  availability_zone = "S1"

  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"

  compute_name = "compute-name"

  is_encrypted = true

  bootable = false

  enable_backup = true
}
