variable "api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "is_cspm_enabled" {
  description = "Whether Datadog collects cloud security posture management resources from your GCP project"
  type        = bool
  default     = false
}

variable "labels" {
  description = "A map of labels to add to all resources"
  type        = map(string)
  default = {
    system = "datadog"
  }
}

variable "project" {
  description = "Google Cloud Project ID being monitored"
  type        = string
}
