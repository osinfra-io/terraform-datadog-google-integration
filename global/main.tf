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
  client_email    = google_service_account.this.email
  is_cspm_enabled = var.is_cspm_enabled
  host_filters    = ["datadog:monitored"]
}

# Google Service Account Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account

resource "google_service_account" "this" {
  account_id   = "datadog"
  display_name = "Service Account for Datadog"
  project      = var.project
}

# Google Service Account IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam_member

resource "google_service_account_iam_member" "this" {
  member             = "serviceAccount:${datadog_integration_gcp_sts.this.delegate_account_email}"
  role               = "roles/iam.serviceAccountTokenCreator"
  service_account_id = google_service_account.this.name
}

# Google Project IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member

resource "google_project_iam_member" "this" {
  for_each = toset([
    "roles/browser",
    "roles/cloudasset.viewer",
    "roles/compute.viewer",
    "roles/monitoring.viewer",
  ])

  member  = "serviceAccount:${google_service_account.this.email}"
  project = var.project
  role    = each.key
}

# Google PubSub Topic Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic

resource "google_pubsub_topic" "this" {
  labels  = local.labels
  name    = "export-logs-to-datadog"
  project = var.project
}

# Google PubSub Subscription Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription

resource "google_pubsub_subscription" "this" {
  labels  = local.labels
  name    = "export-logs-to-datadog"
  project = var.project
  topic   = google_pubsub_topic.this.name

  push_config {
    push_endpoint = "https://gcp-intake.logs.datadoghq.com/api/v2/logs?dd-api-key=${var.api_key}&dd-protocol=gcp"
  }
}

# Google Logging Project Sink Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink

resource "google_logging_project_sink" "this" {
  destination = "pubsub.googleapis.com/projects/${var.project}/topics/${google_pubsub_topic.this.name}"

  exclusions {
    name   = "exclude-datadog-logs"
    filter = "protoPayload.authenticationInfo.principalEmail=\"${google_service_account.this.email}\""
  }

  name                   = "export-logs-to-datadog"
  project                = var.project
  unique_writer_identity = true
}

# Google PubSub Topic IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam#google_pubsub_topic_iam_member

resource "google_pubsub_topic_iam_member" "this" {
  member  = google_logging_project_sink.this.writer_identity
  project = var.project
  role    = "roles/pubsub.publisher"
  topic   = google_pubsub_topic.this.name
}
