# Datadog Provider
# https://registry.terraform.io/providers/DataDog/datadog/latest/docs

terraform {
  required_providers {
    datadog = {
      source = "datadog/datadog"
    }
  }
}

# Datadog Integration Google Resource
# https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/integration_gcp_sts

resource "datadog_integration_gcp_sts" "this" {
  client_email                       = google_service_account.integration.email
  host_filters                       = var.host_filters
  is_cspm_enabled                    = var.is_cspm_enabled
  is_security_command_center_enabled = var.is_security_command_center_enabled
}

# Google BigQuery Dataset Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset

resource "google_bigquery_dataset" "billing_export" {

  # Ensure Big Query Datasets are encrypted with Customer Supplied Encryption Keys (CSEK)
  # checkov:skip=CKV_GCP_81: Not really needed for the billing export dataset

  count = var.enable_cloud_cost_management ? 1 : 0

  dataset_id    = "billing_export"
  description   = "Cloud Billing data to export to BigQuery"
  friendly_name = "Billing Export"
  labels        = var.labels
  location      = var.cloud_cost_management_location

  project = var.project
}

# Google BigQuery Dataset IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam_member

resource "google_bigquery_dataset_iam_member" "billing_export" {
  count = var.enable_cloud_cost_management ? 1 : 0

  dataset_id = google_bigquery_dataset.billing_export[0].dataset_id
  member     = "serviceAccount:${google_service_account.integration.email}"
  project    = var.project
  role       = "roles/bigquery.dataEditor"
}

# Google Cloud Asset Project Feed Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_asset_project_feed

resource "google_cloud_asset_project_feed" "export_asset_changes_to_datadog" {
  asset_types = [".*"]

  feed_output_config {
    pubsub_destination {
      topic = google_pubsub_topic.export_asset_changes_to_datadog.name
    }
  }

  feed_id = "export-asset-changes-to-datadog"
  project = var.project
}

# Google Service Account Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account

resource "google_service_account" "integration" {
  account_id   = "datadog"
  display_name = "Service Account for Datadog"
  project      = var.project
}

# Google Service Account IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam_member

resource "google_service_account_iam_member" "integration" {
  member             = "serviceAccount:${datadog_integration_gcp_sts.this.delegate_account_email}"
  role               = "roles/iam.serviceAccountTokenCreator"
  service_account_id = google_service_account.integration.name
}

# Google Storage Bucket Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket

resource "google_storage_bucket" "cloud_cost_management" {

  # Ensure public access prevention is enforced on Cloud Storage bucket
  # checkov:skip=CKV_GCP_114: This need to be a public bucket to allow Datadog to access

  # Ensure Cloud storage has versioning enabled
  # checkov:skip=CKV_GCP_78: We don't need versioning for the billing export bucket

  # Bucket should log access
  # checkov:skip=CKV_GCP_62: We don't need logging for the billing export bucket

  count = var.enable_cloud_cost_management ? 1 : 0

  labels                      = var.labels
  location                    = var.cloud_cost_management_location
  name                        = "datadog-cloud-cost-management-${random_id.this.hex}"
  project                     = var.project
  uniform_bucket_level_access = true
}

# Google Storage Bucket IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member

resource "google_storage_bucket_iam_member" "cloud_cost_management" {
  for_each = var.enable_cloud_cost_management ? toset([
    "roles/storage.legacyObjectReader",
    "roles/storage.legacyBucketWriter"
  ]) : toset([])

  bucket = google_storage_bucket.cloud_cost_management[0].name
  member = "serviceAccount:${google_service_account.integration.email}"
  role   = each.key
}

# Google Project IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member

resource "google_project_iam_member" "this" {
  for_each = toset([
    "organizations/163313809793/roles/datadog.cloudCostManagement",
    "roles/browser",
    "roles/cloudasset.viewer",
    "roles/compute.viewer",
    "roles/monitoring.viewer",
    "roles/securitycenter.findingsViewer"
  ])

  member  = "serviceAccount:${google_service_account.integration.email}"
  project = var.project
  role    = each.key
}

# Google PubSub Topic Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic

resource "google_pubsub_topic" "export_asset_changes_to_datadog" {

  # Ensure PubSub Topics are encrypted with Customer Supplied Encryption Keys (CSEK)
  # Not necessary for this use case
  # checkov:skip=CKV_GCP_83

  labels  = var.labels
  name    = "export-asset-changes-to-datadog"
  project = var.project
}

resource "google_pubsub_topic" "integration" {

  # Ensure PubSub Topics are encrypted with Customer Supplied Encryption Keys (CSEK)
  # Not necessary for this use case
  # checkov:skip=CKV_GCP_83

  labels  = var.labels
  name    = "export-logs-to-datadog"
  project = var.project
}

# Google PubSub Subscription Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription

resource "google_pubsub_subscription" "export_asset_changes_to_datadog" {
  labels  = var.labels
  name    = "export-asset-changes-to-datadog"
  project = var.project
  topic   = google_pubsub_topic.export_asset_changes_to_datadog.name
}

resource "google_pubsub_subscription" "integration" {
  labels  = var.labels
  name    = "export-logs-to-datadog"
  project = var.project
  topic   = google_pubsub_topic.integration.name

  push_config {
    push_endpoint = "https://gcp-intake.logs.datadoghq.com/api/v2/logs?dd-api-key=${var.api_key}&dd-protocol=gcp"
  }
}

# Google Logging Project Sink Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink

resource "google_logging_project_sink" "integration" {
  destination = "pubsub.googleapis.com/projects/${var.project}/topics/${google_pubsub_topic.integration.name}"

  exclusions {
    name   = "exclude-datadog-logs"
    filter = "protoPayload.authenticationInfo.principalEmail=\"${google_service_account.integration.email}\""
  }

  name                   = "export-logs-to-datadog"
  project                = var.project
  unique_writer_identity = true
}

# Google PubSub Topic IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam#google_pubsub_topic_iam_member

resource "google_pubsub_topic_iam_member" "export_asset_changes_to_datadog" {
  member  = "serviceAccount:${google_service_account.integration.email}"
  project = var.project
  role    = "roles/pubsub.subscriber"
  topic   = google_pubsub_topic.export_asset_changes_to_datadog.name
}

resource "google_pubsub_topic_iam_member" "integration" {
  member  = google_logging_project_sink.integration.writer_identity
  project = var.project
  role    = "roles/pubsub.publisher"
  topic   = google_pubsub_topic.integration.name
}

# Random ID Resource
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id

resource "random_id" "this" {
  prefix      = "tf"
  byte_length = "2"
}
