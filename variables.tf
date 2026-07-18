variable "compartment_id" {
  description = "OCID of the compartment in which to create the autonomous database."
  type        = string
}

variable "display_name" {
  description = "Human-readable name for the autonomous database."
  type        = string
}

variable "db_name" {
  description = "Database name (alphanumeric, up to 14 characters, no reserved words)."
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z][A-Za-z0-9]{0,13}$", var.db_name))
    error_message = "db_name must start with a letter and be 1-14 alphanumeric characters."
  }
}

variable "db_workload" {
  description = "Autonomous database workload type."
  type        = string
  default     = "OLTP"

  validation {
    condition     = contains(["OLTP", "DW", "AJD", "APEX"], var.db_workload)
    error_message = "db_workload must be OLTP, DW, AJD, or APEX."
  }
}

variable "compute_model" {
  description = "Compute model for the database (ECPU or OCPU)."
  type        = string
  default     = "ECPU"
}

variable "compute_count" {
  description = "Number of compute units (ECPUs or OCPUs) allocated to the database."
  type        = number
  default     = 2
}

variable "data_storage_size_in_tbs" {
  description = "Data storage size in terabytes."
  type        = number
  default     = 1
}

variable "is_auto_scaling_enabled" {
  description = "Whether compute auto-scaling is enabled."
  type        = bool
  default     = true
}

variable "is_free_tier" {
  description = "Whether the database is an Always Free autonomous database."
  type        = bool
  default     = false
}

variable "admin_password" {
  description = "ADMIN user password. Null generates a wallet-managed password (must be set for real deployments)."
  type        = string
  default     = null
  sensitive   = true
}

variable "license_model" {
  description = "License model for the database."
  type        = string
  default     = "LICENSE_INCLUDED"

  validation {
    condition     = contains(["LICENSE_INCLUDED", "BRING_YOUR_OWN_LICENSE"], var.license_model)
    error_message = "license_model must be LICENSE_INCLUDED or BRING_YOUR_OWN_LICENSE."
  }
}

variable "freeform_tags" {
  description = "Free-form tags applied to the autonomous database."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags applied to the autonomous database, keyed as \"namespace.key\"."
  type        = map(string)
  default     = {}
}
