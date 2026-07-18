provider "oci" {}

module "database" {
  source = "../.."

  compartment_id = var.compartment_id
  display_name   = "example-adb"
  db_name        = "exampledb"
  db_workload    = "OLTP"

  compute_count            = 2
  data_storage_size_in_tbs = 1
  admin_password           = var.admin_password

  freeform_tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

variable "compartment_id" {
  description = "Compartment OCID to deploy the example database into."
  type        = string
}

variable "admin_password" {
  description = "ADMIN password for the example autonomous database."
  type        = string
  sensitive   = true
}

output "database_id" {
  value = module.database.id
}
