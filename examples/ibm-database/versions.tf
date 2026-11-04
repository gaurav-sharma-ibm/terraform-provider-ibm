terraform {
  required_version = ">= 0.12"

  required_providers {
    ibm = {
      source  = "local/ibm-cloud/ibm"
      version = "2.8.0"
    }
  }
}
