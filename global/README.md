# Terraform Documentation

A child module automatically inherits its parent's default (un-aliased) provider configurations. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.33.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 5.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_integration_gcp_sts.this](https://registry.terraform.io/providers/datadog/datadog/latest/docs/resources/integration_gcp_sts) | resource |
| [google_logging_project_sink.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink) | resource |
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_pubsub_subscription.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_topic.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |
| [google_pubsub_topic_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam_member) | resource |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Datadog API key | `string` | n/a | yes |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | The cost center to use for resource labels | `string` | n/a | yes |
| <a name="input_is_cspm_enabled"></a> [is\_cspm\_enabled](#input\_is\_cspm\_enabled) | Whether Datadog collects cloud security posture management resources from your GCP project | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of key/value pairs to assign to the resources being created | `map(string)` | <pre>{<br>  "system": "datadog"<br>}</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud Project ID being monitored | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
