module "volume" {
  source = "Airtel-Cloud-Platform/volume/airtelcloud"

  name = "data-volume"

  size = 50

  type = "s1_wkld_ntp02_4iops_backend"

  availability_zone = "S1"

  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"
}
