resource "airtelcloud_volume" "this" {
  name = var.name

  size = var.size

  type = var.type

  availability_zone = var.availability_zone

  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name

  compute_name = var.compute_name

  is_encrypted = var.is_encrypted
  bootable     = var.bootable

  enable_backup = var.enable_backup
}
