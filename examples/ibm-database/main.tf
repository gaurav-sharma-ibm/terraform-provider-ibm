data "ibm_database_point_in_time_recovery" "source" {
  deployment_id = "crn:v1:bluemix:public:databases-for-postgresql-cdp-dev:us-east:a/23b09aee04da4545b6e32805fa93249d:895f62e7-9d80-4591-a48d-e38d4b4204c0::"
}

output "pitr_earliest_time" {
  description = "Earliest time a restore can target"
  value       = data.ibm_database_point_in_time_recovery.source.earliest_point_in_time_recovery_time
}

output "pitr_latest_time" {
  description = "Latest time a restore can target (empty when not_restorable_reason is set)"
  value       = data.ibm_database_point_in_time_recovery.source.latest_point_in_time_recovery_time
}

output "pitr_retention_days" {
  description = "Days of history kept for point-in-time recovery"
  value       = data.ibm_database_point_in_time_recovery.source.retention_days
}

output "pitr_archiving_status" {
  description = "Change archiving state: healthy, delayed or unknown"
  value       = data.ibm_database_point_in_time_recovery.source.archiving_status
}

output "pitr_unavailable_periods" {
  description = "Periods inside the window that cannot be restored to"
  value       = data.ibm_database_point_in_time_recovery.source.unavailable_periods
}

output "pitr_not_restorable_reason" {
  description = "Why the instance cannot be restored now (empty when it can)"
  value       = data.ibm_database_point_in_time_recovery.source.not_restorable_reason
}

# resource "ibm_database" "postgres_gen2_restore" {
#   name              = "gaurav-pg-pitr2-terraform-test-1"
#   plan              = "databases-for-postgresql-cdp-dev-standard"
#   location          = "us-east"
#   service           = "databases-for-postgresql-cdp-dev"
#   service_endpoints = "private"
#   cdp_placement     = "cds-sdbx6-mzr-wdc-cp-1"

#   point_in_time_recovery_deployment_id = ibm_database.postgres_gen2.id
#   point_in_time_recovery_time          = data.ibm_database_point_in_time_recovery.source.latest_point_in_time_recovery_time

#   point_in_time_recovery_deployment_id = "crn:v1:bluemix:public:databases-for-postgresql-cdp-dev:us-east:a/23b09aee04da4545b6e32805fa93249d:5847c6bb-499c-403e-aea1-6dfe065b076a::"
#   point_in_time_recovery_time          = "2026-10-29T09:40:03Z"
#   timeouts {
#     create = "180m"
#   }
# }
