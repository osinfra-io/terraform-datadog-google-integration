# Required Providers
# https://developer.hashicorp.com/terraform/language/providers/requirements

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
  api_key = var.api_key
  app_key = var.app_key
}

module "test" {
  source = "../../../"

  api_key                      = var.api_key
  enable_cloud_cost_management = false
  is_cspm_enabled              = true

  labels = {
    cost-center = "x000"
    env         = "sb"
    repository  = "terraform-google-storage-bucket"
    team        = "testing"
  }

  project = var.project
}
