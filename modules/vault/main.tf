resource "vault_audit" "audit" {
  provider = vault.vault
  type     = "file"

  options = {
    file_path = "/vault/logs/audit"
  }
}

resource "vault_auth_backend" "userpass" {
  provider = vault.vault
  type     = "userpass"
}

resource "vault_generic_secret" "service" {
  provider = vault.vault
  path     = "secret/${var.environment}/${var.service}"

  data_json = <<EOT
{
  "db_user":   "${var.service}",
  "db_password": "${var.db_password}"
}
EOT
}

resource "vault_policy" "service" {
  provider = vault.vault
  name     = "${var.service}-${var.environment}"

  policy = <<EOT
path "secret/data/${var.environment}/${var.service}" {
    capabilities = ["list", "read"]
}
EOT
}

resource "vault_generic_endpoint" "service" {
  provider             = vault.vault
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/${var.service}-${var.environment}"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["${var.service}-${var.environment}"],
  "password": ${var.policies_password}
}
EOT
}

