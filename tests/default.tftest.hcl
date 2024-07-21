mock_provider "datadog" {}
mock_provider "google" {
  mock_resource "google_service_account" {
    defaults = {
      name  = "projects/mock/serviceAccounts/gke-tf777641-workload-identity@mock.iam.gserviceaccount.com"
      email = "gke-tf777641-workload-identity@mock.iam.gserviceaccount.com"
    }
  }
  mock_resource "google_logging_project_sink" {
    defaults = {
      writer_identity = "gke-tf777641-workload-identity@mock.iam.gserviceaccount.com"
    }
  }
}

run "default" {
  command = apply
  variables  {
    api_key = "mock"
    app_key = "mock"
  }

  module {
    source = "./tests/fixtures/default"
  }
}
