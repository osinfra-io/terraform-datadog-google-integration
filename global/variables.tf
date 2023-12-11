variable "api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "cost_center" {
  description = "The cost center to use for resource labels"
  type        = string
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
  description = "Google Cloud Project ID being monitored"
  type        = string
}
