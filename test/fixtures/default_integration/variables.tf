variable "api_key" {
  description = "Datadog API key"
  type        = string
}

variable "app_key" {
  description = "Datadog APP key"
  type        = string
}

variable "project" {
  type    = string
  default = "testing-kitchen-tf11-sb"
}
