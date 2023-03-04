variable "domain" {
  type        = string
  description = "The domain under which to register ingresses."
}

variable "onepassword_vault_id" {
  type        = string
  description = "1Password vault ID to use for secret storage."
}

variable "minio_region" {
  type        = string
  description = "The region to use for Minio."
}

variable "minio_server" {
  type        = string
  description = "The Minio host."
}
