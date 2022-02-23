variable "environment" {
  description = "environment"
  type        = string
  default     = "staging"
}
variable "service" {
  description = "service"
  type        = string
  default     = "account"
}

variable "vault_token" {
  description = "Vault token"
  type        = string
  default     = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
}

variable "vault_db_password" {
  description = "Vault database password"
  type        = string
  default     = "whatever"
}

variable "vault_policies_password" {
  description = "Vault policies password"
  type        = string
  default     = "a63e8938-6d49-49ea-905d-e03a683059e7"
}
