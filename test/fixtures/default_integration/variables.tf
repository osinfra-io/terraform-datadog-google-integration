variable "api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "app_key" {
  description = "Datadog APP key"
  type        = string
  sensitive   = true
}

variable "project" {
  type    = string
  default = "test-vpc-host-tf12-sb"
}
