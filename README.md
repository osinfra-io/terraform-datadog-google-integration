# <img align="left" width="45" height="45" src="https://github.com/osinfra-io/terraform-datadog-google-integration/assets/1610100/95823e0c-3573-48fa-a2bc-646da96d76d6"> Datadog - Google Cloud Platform Integration Terraform Module

**[GitHub Actions](https://github.com/osinfra-io/terraform-datadog-google-integration/actions):**

[![Terraform Tests](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/test.yml/badge.svg)](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/test.yml) [![Dependabot](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/7fa0af09-f883-4e0e-8103-351614a07df3/branch/b6b77a3f-4fe8-4079-a39f-d3e1f715e543)](https://dashboard.infracost.io/org/osinfra-io/repos/7fa0af09-f883-4e0e-8103-351614a07df3?tab=settings)

💵 Monthly estimates based on Infracost baseline costs.

## Repository Description

Terraform **example** module for Datadog Google Cloud Platform integration.

> [!NOTE]
> We do not recommend consuming this module like you might a [public module](https://registry.terraform.io/browse/modules). It is a baseline, something you can fork, potentially maintain, and modify to fit your organization's needs. Using public modules vs. writing your own has various [drivers and trade-offs](https://docs.osinfra.io/fundamentals/architecture-decision-records/adr-0003) that your organization should evaluate.

## 🔩 Usage

> [!TIP]
> You can check the [fixtures](fixtures) directory for example configurations. These fixtures set up the system for testing by providing all the necessary initial code, thus creating good examples on which to base your configurations.

Required APIs (managed with the [terraform-google-project](https://github.com/osinfra-io/terraform-google-project) child module):

- `bigquerydatatransfer.googleapis.com` (If `enable_cloud_cost_management` is `true`)
- `bigquery.googleapis.com` (If `enable_cloud_cost_management` is `true`)
- `cloudasset.googleapis.com`
- `cloudbilling.googleapis.com`
- `cloudresourcemanager.googleapis.com`
- `compute.googleapis.com`
- `iam.googleapis.com`
- `monitoring.googleapis.com`

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration and applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository, describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a local development environment [here](https://docs.osinfra.io/fundamentals/development-setup).

### 🛠️ Tools

- [checkov](https://github.com/bridgecrewio/checkov)
- [infracost](https://github.com/infracost/infracost)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [gcp-cloud-cost-management](https://docs.datadoghq.com/cloud_cost_management/google_cloud)
- [gcp-integration](https://docs.datadoghq.com/integrations/google_cloud_platform)

### 🔍 Tests

You'll need to be a member of the [platform-contributors](https://groups.google.com/a/osinfra.io/g/platform-contributors) Google Group to run the tests. This group manages access to the resource hierarchy's `Testing/Sandbox` folder. You can request access to this group by opening an issue [here](https://github.com/osinfra-io/google-cloud-hierarchy/issues/new?assignees=&labels=enhancement&projects=&template=add-update-identity-group.yml&title=Add+or+update+identity+group).

```none
cd fixtures/default
```

```none
terraform init
```

```none
terraform test -var="api_key=$DATADOG_API_KEY" -var="app_key=$DATADOG_APP_KEY"
```

## 📓 Terraform Documentation

> A child module automatically inherits default (un-aliased) provider configurations from its parent. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGIN_TF_DOCS -->
### Providers

| Name | Version |
|------|---------|
| datadog | 3.44.1 |
| google | 6.2.0 |
| random | 3.6.3 |

### Resources

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

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_key | Datadog API key | `string` | n/a | yes |
| cloud\_cost\_management\_location | The location for the cloud cost management bucket and Bigquery dataset, only used if enable\_cloud\_cost\_management is true | `string` | `"US"` | no |
| enable\_cloud\_cost\_management | Whether Datadog collects cloud cost management data from your GCP project, this should only be set to true in a single project | `bool` | `false` | no |
| host\_filters | A list of host filters to apply to the Datadog GCP integration | `list(string)` | `[]` | no |
| is\_cspm\_enabled | Whether Datadog collects cloud security posture management resources from your GCP project | `bool` | `false` | no |
| is\_security\_command\_center\_enabled | When enabled, Datadog will attempt to collect Security Command Center Findings. Note: This requires additional permissions on the service account | `bool` | `false` | no |
| labels | A map of key/value pairs to assign to the resources being created | `map(string)` | ```{ "system": "datadog" }``` | no |
| project | The ID of the project in which the resource belongs | `string` | n/a | yes |
<!-- END_TF_DOCS -->
