module "vault" {
  source            = "../../../modules/vault"
  environment       = var.environment
  service           = var.service
  db_password       = var.vault_db_password
  policies_password = var.vault_policies_password
}
