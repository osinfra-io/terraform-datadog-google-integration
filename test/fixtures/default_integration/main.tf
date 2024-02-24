terraform {
  required_providers {
    datadog = {
      source = "datadog/datadog"
    }
  }
}

provider "datadog" {
  api_key = var.api_key
  app_key = var.app_key
}

module "test" {
  source = "../../../global"

  api_key         = var.api_key
  cost_center     = "x000"
  is_cspm_enabled = true

  labels = {
    env        = "sb"
    repository = "terraform-google-storage-bucket"
    team       = "testing"
  }

  project = var.project
}
