variable "domain" {
  type        = string
  description = "The domain under which to register ingresses."
}

variable "onepassword_vault_id" {
  type        = string
  description = "1Password vault ID to use for secret storage."
}
