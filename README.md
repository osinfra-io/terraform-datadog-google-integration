# <img align="left" width="45" height="45" src="https://github.com/osinfra-io/terraform-datadog-google-integration/assets/1610100/95823e0c-3573-48fa-a2bc-646da96d76d6"> Datadog - Google Cloud Platform Integration Terraform Module

**[GitHub Actions](https://github.com/osinfra-io/terraform-datadog-google-integration/actions):**

[![Kitchen Tests](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/kitchen.yml/badge.svg)](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/kitchen.yml) [![CodeQL](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/github-code-scanning/codeql/badge.svg)](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/github-code-scanning/codeql) [![Dependabot](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/terraform-datadog-google-integration/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?label=Default&url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/b2687edb-3eb9-4f6b-99b3-545ec27bab4d/branch/ef3d37cf-2b03-430b-a51d-e06be6e98921/terraform-datadog-google-integration%2520-%2520Default)](https://dashboard.infracost.io/org/osinfra-io/repos/b2687edb-3eb9-4f6b-99b3-545ec27bab4d?tab=settings)

Monthly cost estimates for this module based on these usage values:

- [default_integration](test/fixtures/default_integration/infracost-usage.yml)

## Repository Description

Terraform **example** module for Datadog Google Cloud Platform integration.

💡 *We do not recommend consuming this module like you might a [public module](https://registry.terraform.io/browse/modules). Its purpose is to be a baseline, something you can fork and potentially maintain on your own and modify to fit your organization's needs. Using public modules vs. writing your own have various [drivers and trade-offs](https://docs.osinfra.io/fundamentals/architecture-decision-records/adr-0003) that your organization should evaluate.*

## 🔩 Usage

You can check the [test/fixtures](test/fixtures/) directory for example configurations. These fixtures set up the system for the testing process by providing it with all the necessary code to initialize it, thus creating good examples to base your configurations on.

Here is an example of a basic configuration:

```hcl
module "datadog" {
  source   = "github.com/osinfra-io/terraform-datadog-google-integration//global?ref=v0.0.0"

  api_key         = var.api_key
  is_cspm_enabled = true
  project         = "example-project"
}
```

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a local development environment [here](https://docs.osinfra.io/fundamentals/development-setup).

### 🛠️ Tools

- [infracost](https://github.com/infracost/infracost)
- [inspec](https://github.com/inspec/inspec)
- [kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [gcp-integration](https://docs.datadoghq.com/integrations/google_cloud_platform)

### 🔍 Tests

```none
bundle exec kitchen converge
```

```none
bundle exec kitchen verify
```

```none
bundle exec kitchen destroy
```

## 📓 Terraform Documentation

- [global](global/README.md)
