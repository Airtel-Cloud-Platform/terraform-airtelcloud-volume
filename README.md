# Airtel Cloud Volume Terraform Module

Terraform module for provisioning Airtel Cloud Block Storage Volumes.

## Features

- Creates Block Storage Volumes
- Supports Volume Attachment to Compute Instances
- Supports Encrypted Volumes
- Supports Backup Enabled Volumes
- Exposes Volume Outputs for Downstream Modules

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

  is_encrypted = true

  bootable = false

  enable_backup = true
}
```

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| name | Volume name | string | Yes |
| size | Volume size in GB | number | Yes |
| type | Volume type | string | Yes |
| availability_zone | Availability Zone | string | Yes |
| vpc_name | VPC NAME | string | Yes |
| subnet_name | Subnet NAME | string | Yes |
| compute_name | Compute Instance NAME | string | No |
| is_encrypted | Enable Volume Encryption | bool | No |
| bootable | Whether volume is bootable | bool | No |
| enable_backup | Enable Volume Backup | bool | No |

## Outputs

| Name | Description |
|------|-------------|
| volume_id | Volume ID |
| volume_uuid | Volume UUID |
| volume_status | Volume Status |
| volume | Complete Volume Object |

## Notes

### Standalone Volume

To create a volume without attaching it to a VM:

```hcl
compute_name = null
```

### Attach Volume To VM

```hcl
compute_name = module.vm.vm_name
```

Changing `compute_name` detaches the volume from the current VM and attaches it to the new VM without recreating the volume.

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.5 |
| airtelcloud Provider | >= 1.1.3 |
