variable "namespace" {
  type        = string
  description = "The Kubernetes namespace for the 1Password deployment."
}

variable "domain" {
  type        = string
  description = "Hostname for 1Password Connect API."
}
