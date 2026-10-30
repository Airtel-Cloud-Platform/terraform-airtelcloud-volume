output "volume_id" {
  description = "Volume ID"
  value       = airtelcloud_volume.this.id
}

output "volume_uuid" {
  description = "Volume UUID"
  value       = airtelcloud_volume.this.uuid
}

output "provider_volume_id" {
  description = "Provider-specific volume ID"
  value       = airtelcloud_volume.this.provider_volume_id
}

output "volume_status" {
  description = "Volume status (available, in-use, etc.)"
  value       = airtelcloud_volume.this.status
}

output "attached_to" {
  description = "Compute instance ID the volume is attached to"
  value       = airtelcloud_volume.this.attached_to
}

output "attachment_device" {
  description = "Device name when attached (e.g., /dev/sdb)"
  value       = airtelcloud_volume.this.attachment_device
}

output "volume" {
  description = "Complete volume object with all exported attributes"
  value = {
    id                 = airtelcloud_volume.this.id
    uuid               = airtelcloud_volume.this.uuid
    provider_volume_id = airtelcloud_volume.this.provider_volume_id
    status             = airtelcloud_volume.this.status
    attached_to        = airtelcloud_volume.this.attached_to
    attachment_device  = airtelcloud_volume.this.attachment_device
  }
}
