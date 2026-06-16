output "volume_id" {
  description = "Volume ID"

  value = airtelcloud_volume.this.id
}

output "volume_uuid" {
  description = "Volume UUID"

  value = airtelcloud_volume.this.uuid
}

output "volume_status" {
  description = "Volume status"

  value = airtelcloud_volume.this.status
}

output "volume" {
  description = "Complete volume object"

  value = {
    id     = airtelcloud_volume.this.id
    uuid   = airtelcloud_volume.this.uuid
    status = airtelcloud_volume.this.status
  }
}
