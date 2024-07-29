variable "api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "cloud_cost_management_location" {
  description = "The location for the cloud cost management bucket and Bigquery dataset, only used if enable_cloud_cost_management is true"
  type        = string
  default     = "US"
}

variable "enable_cloud_cost_management" {
  description = "Whether Datadog collects cloud cost management data from your GCP project, this should only be set to true in a single project"
  type        = bool
  default     = false
}

variable "is_cspm_enabled" {
  description = "Whether Datadog collects cloud security posture management resources from your GCP project"
  type        = bool
  default     = false
}

variable "labels" {
  description = "A map of key/value pairs to assign to the resources being created"
  type        = map(string)
  default = {
    system = "datadog"
  }
}

variable "project" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}
