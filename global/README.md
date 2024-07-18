# Terraform Documentation

A child module automatically inherits its parent's default (un-aliased) provider configurations. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.41.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 5.38.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_integration_gcp_sts.this](https://registry.terraform.io/providers/datadog/datadog/latest/docs/resources/integration_gcp_sts) | resource |
| [google_bigquery_dataset.billing_export](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset) | resource |
| [google_bigquery_dataset_iam_member.billing_export](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam_member) | resource |
| [google_logging_project_sink.integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink) | resource |
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_pubsub_subscription.integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_topic.integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |
| [google_pubsub_topic_iam_member.integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam_member) | resource |
| [google_service_account.integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_storage_bucket.cloud_cost_management](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.cloud_cost_management](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Datadog API key | `string` | n/a | yes |
| <a name="input_cloud_cost_management_location"></a> [cloud\_cost\_management\_location](#input\_cloud\_cost\_management\_location) | The location for the cloud cost management bucket and Bigquery dataset, only used if enable\_cloud\_cost\_management is true | `string` | `"US"` | no |
| <a name="input_enable_cloud_cost_management"></a> [enable\_cloud\_cost\_management](#input\_enable\_cloud\_cost\_management) | Whether Datadog collects cloud cost management data from your GCP project, this should only be set to true in a single project | `bool` | `false` | no |
| <a name="input_is_cspm_enabled"></a> [is\_cspm\_enabled](#input\_is\_cspm\_enabled) | Whether Datadog collects cloud security posture management resources from your GCP project | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of key/value pairs to assign to the resources being created | `map(string)` | <pre>{<br>  "system": "datadog"<br>}</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud Project ID being monitored | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
