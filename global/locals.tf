# Terraform Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  labels = merge(
    {
      cost-center = var.cost_center
    },
    var.labels
  )
}
