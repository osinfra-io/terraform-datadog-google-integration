terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }

    datadog = {
      source = "datadog/datadog"
    }
  }
}

provider "datadog" {
  api_key = "mock"
  app_key = "mock"
}

module "test" {
  source = "../../../"

  api_key                      = "mock"
  enable_cloud_cost_management = var.enable_cloud_cost_management
  is_cspm_enabled              = true
  labels                       = local.labels
  project                      = var.project
}
