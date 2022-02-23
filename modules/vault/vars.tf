variable "environment" {
  description = "environment"
  type        = string
}

variable "service" {
  description = "service, example payment"
  type        = string
}

variable "db_password" {
  description = "database password"
  type        = string
}

variable "policies_password" {
  description = "policies password"
  type        = string
}
