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
  is_cspm_enabled = true
  project         = var.project
}
