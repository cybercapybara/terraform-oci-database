# terraform-oci-database

Terraform module that manages an [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)
Autonomous Database. It supports OLTP, Data Warehouse, JSON and APEX workloads, ECPU/OCPU
compute models, auto-scaling and Always Free provisioning.

## Usage

```hcl
module "database" {
  source = "github.com/moveeeax/terraform-oci-database"

  compartment_id = var.compartment_id
  display_name   = "prod-adb"
  db_name        = "proddb"
  db_workload    = "OLTP"

  compute_count            = 4
  data_storage_size_in_tbs = 2
  is_auto_scaling_enabled  = true
  admin_password           = var.admin_password

  freeform_tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| oci       | >= 5.0   |

## Inputs

| Name                       | Description                                                     | Type          | Default              | Required |
|----------------------------|-----------------------------------------------------------------|---------------|----------------------|:--------:|
| `compartment_id`           | OCID of the compartment in which to create the database.        | `string`      | n/a                  |   yes    |
| `display_name`             | Human-readable name for the autonomous database.                | `string`      | n/a                  |   yes    |
| `db_name`                  | Database name (1-14 alphanumeric, starts with a letter).        | `string`      | n/a                  |   yes    |
| `db_workload`              | Workload type (`OLTP`, `DW`, `AJD`, `APEX`).                    | `string`      | `"OLTP"`             |    no    |
| `compute_model`            | Compute model (`ECPU` or `OCPU`).                              | `string`      | `"ECPU"`             |    no    |
| `compute_count`            | Number of compute units allocated.                             | `number`      | `2`                  |    no    |
| `data_storage_size_in_tbs` | Data storage size in terabytes.                                | `number`      | `1`                  |    no    |
| `is_auto_scaling_enabled`  | Whether compute auto-scaling is enabled.                       | `bool`        | `true`               |    no    |
| `is_free_tier`             | Whether the database is Always Free.                           | `bool`        | `false`              |    no    |
| `admin_password`           | ADMIN user password.                                           | `string`      | `null`               |    no    |
| `license_model`            | License model.                                                 | `string`      | `"LICENSE_INCLUDED"` |    no    |
| `freeform_tags`            | Free-form tags applied to the database.                        | `map(string)` | `{}`                 |    no    |
| `defined_tags`             | Defined tags applied to the database, keyed `namespace.key`.   | `map(string)` | `{}`                 |    no    |

## Outputs

| Name                  | Description                                    |
|-----------------------|------------------------------------------------|
| `id`                  | OCID of the autonomous database.               |
| `db_name`             | Database name.                                 |
| `connection_strings`  | Connection strings for the database.           |
| `service_console_url` | URL of the database service console.           |
| `state`               | Lifecycle state of the autonomous database.    |

## License

[MIT](LICENSE)
