resource "oci_database_autonomous_database" "this" {
  compartment_id = var.compartment_id
  display_name   = var.display_name
  db_name        = var.db_name
  db_workload    = var.db_workload

  compute_model            = var.compute_model
  compute_count            = var.compute_count
  data_storage_size_in_tbs = var.data_storage_size_in_tbs
  is_auto_scaling_enabled  = var.is_auto_scaling_enabled
  is_free_tier             = var.is_free_tier
  admin_password           = var.admin_password
  license_model            = var.license_model

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
