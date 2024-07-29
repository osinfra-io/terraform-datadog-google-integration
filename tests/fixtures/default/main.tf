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
  enable_cloud_cost_management = false
  is_cspm_enabled              = true

  labels = {
    cost-center = "x000"
    env         = "mock"
    repository  = "mock"
    team        = "mock"
  }

  project = "mock"
}

