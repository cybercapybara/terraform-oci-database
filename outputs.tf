output "id" {
  description = "OCID of the autonomous database."
  value       = oci_database_autonomous_database.this.id
}

output "db_name" {
  description = "Database name."
  value       = oci_database_autonomous_database.this.db_name
}

output "connection_strings" {
  description = "Connection strings for the autonomous database."
  value       = oci_database_autonomous_database.this.connection_strings
  sensitive   = true
}

output "service_console_url" {
  description = "URL of the database service console."
  value       = oci_database_autonomous_database.this.service_console_url
}

output "state" {
  description = "Lifecycle state of the autonomous database."
  value       = oci_database_autonomous_database.this.state
}
