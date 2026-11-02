# Airtel Cloud Volume Terraform Module

Terraform module for provisioning Airtel Cloud Block Storage Volumes.

The module wraps the `airtelcloud_volume` resource. VPC, subnet and compute instance are referenced **by name**; the provider resolves them to IDs.

## Features

- Creates Block Storage Volumes
- Resolves VPC, subnet and VM by name
- Attaches volumes to VMs and re-attaches in place
- Supports encrypted, bootable and backup-enabled volumes
- Supports volume labels
- Exposes volume outputs for downstream modules

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.5 |
| airtelcloud Provider | >= 1.3.2 (`labels` support) |

## Usage

### Basic Example

```hcl
module "volume" {
  source = "Airtel-Cloud-Platform/volume/airtelcloud"

  name = "data-volume"

  size = 50

  type = "s1_wkld_ntp02_4iops_backend"

  availability_zone = "S1"

  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"
}
```

### Complete Example

```hcl
module "volume" {
  source = "Airtel-Cloud-Platform/volume/airtelcloud"

  name = "application-data-volume"

  size = 100

  type = "s1_wkld_ntp02_4iops_backend"

  availability_zone = "S1"

  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"

  compute_name = "compute-name"

  is_encrypted  = true
  bootable      = false
  enable_backup = true

  labels = ["env:production", "team:platform"]
}
```

More examples are in [`examples/`](./examples): `basic`, `complete`, `attached` and `encrypted-backup`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Volume name | `string` | n/a | Yes |
| size | Volume size in GB. Must be a whole number between 50 and 4095. | `number` | n/a | Yes |
| type | Volume tier. API type name (e.g. `s1_wkld_ntp02_4iops_backend`) or UI label (e.g. `Standard Performance`). | `string` | n/a | Yes |
| availability_zone | Availability zone (e.g. `S1`) | `string` | n/a | Yes |
| vpc_name | VPC name. Forces replacement if changed. | `string` | n/a | Yes |
| subnet_name | Subnet name. Forces replacement if changed. | `string` | n/a | Yes |
| compute_name | VM instance name to attach to. Omit to leave the volume unattached. | `string` | `null` | No |
| labels | Labels for the volume. Applied after create and updated in place. | `list(string)` | `null` | No |
| is_encrypted | Enable volume encryption. Forces replacement if changed. | `bool` | `false` | No |
| bootable | Whether the volume is bootable. Forces replacement if changed. | `bool` | `false` | No |
| enable_backup | Enable volume backup | `bool` | `false` | No |

## Outputs

| Name | Description |
|------|-------------|
| volume_id | Volume ID (numeric) |
| volume_uuid | Volume UUID |
| provider_volume_id | Provider-specific volume ID |
| volume_status | Volume status (e.g. `available`, `in-use`) |
| attached_to | Compute instance ID the volume is attached to |
| attachment_device | Device path when attached (e.g. `/dev/sdb`) |
| volume | Object with id, uuid, provider_volume_id, status, attached_to, attachment_device |

## Notes

### Standalone Volume

Omit `compute_name` (or set it to `null`) to create a volume without attaching it to a VM.

### Attach Volume To VM

```hcl
compute_name = module.vm.vm_name
```

Changing `compute_name` detaches the volume from the current VM and attaches it to the new VM without recreating the volume.

### Changes That Force Replacement

Changing `vpc_name`, `subnet_name`, `is_encrypted` or `bootable` destroys and recreates the volume. All other inputs update in place.

### Labels

Labels are not accepted by the create API, so the provider applies them with a follow-up request after the volume is created. Changing `labels` updates them in place.

### Changes From Earlier Module Versions

- `labels` input and `volume_uuid` output were added.
- `size` is now validated to 50-4095 GB (previously the module only enforced a 10 GB minimum), matching the provider.
- The provider requirement was raised to `>= 1.3.2` because `labels` is not available in earlier provider releases.

## Import

The underlying resource can be imported by volume UUID:

```shell
terraform import 'module.volume.airtelcloud_volume.this' <volume-uuid>
```
