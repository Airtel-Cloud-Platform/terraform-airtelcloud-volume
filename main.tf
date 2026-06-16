resource "airtelcloud_volume" "this" {
  name = var.name

  size = var.size

  type = var.type

  availability_zone = var.availability_zone

  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id

  compute_id = var.compute_id

  is_encrypted = var.is_encrypted
  bootable     = var.bootable

  enable_backup = var.enable_backup
}
