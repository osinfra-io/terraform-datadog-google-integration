variable "api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "project" {
  type    = string
  default = "testing-kitchen-tf11-sb"
}
