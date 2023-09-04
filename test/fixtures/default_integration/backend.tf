# Backend Configuration
# https://www.terraform.io/language/settings/backends/configuration

terraform {
  backend "gcs" {
    bucket = "plt-lz-testing-2c8b-sb"
  }
}
