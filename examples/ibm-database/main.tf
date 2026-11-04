data "ibm_resource_group" "group" {
  name = "e2e"
}
resource "ibm_database" "test_postgres_gen2_restore" {
  name              = "gaurav-pg-pitr2-gen2-restore-tf-without-cdp-placement"
  plan              = "databases-for-postgresql-cdp-dev-standard"
  location          = "us-east"
  service           = "databases-for-postgresql-cdp-dev"
  resource_group_id = data.ibm_resource_group.group.id
  service_endpoints = "private"
  cdp_placement     = "cds-sdbx6-mzr-wdc-cp-1"

  point_in_time_recovery_deployment_id = "crn:v1:bluemix:public:databases-for-postgresql-cdp-dev:us-east:a/23b09aee04da4545b6e32805fa93249d:895f62e7-9d80-4591-a48d-e38d4b4204c0::"
  point_in_time_recovery_time          = "2026-11-03T08:59:20Z"

  timeouts {
    create = "180m"
  }
}
