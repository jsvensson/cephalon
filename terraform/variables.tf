variable "domain" {
  type        = string
  description = "The domain under which to register ingresses."
}

variable "onepassword_vault_name" {
  type        = string
  description = "1Password vault name to use for secret storage."
}
