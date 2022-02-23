resource "docker_container" "service" {
  image = "form3tech-oss/platformtest-${var.service}"
  name  = "${var.service}_${var.environment}"

  env = [
    "VAULT_ADDR=http://vault-${var.environment}:8200",
    "VAULT_USERNAME=${var.service}-${var.environment}",
    "VAULT_PASSWORD=${var.vault_policies_password}",
    "ENVIRONMENT=${var.environment}"
  ]

  networks_advanced {
    name = "vagrant_${var.environment}"
  }

  lifecycle {
    ignore_changes = all
  }
}