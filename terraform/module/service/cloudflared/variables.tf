variable "namespace" {
  type        = string
  description = "The namespace to use."
}

variable "account_tag" {
  type        = string
  description = "Argo tunnel account tag."
}

variable "tunnel_id" {
  type        = string
  description = "The UUID for the Cloudflare tunnel."
}

variable "tunnel_name" {
  type        = string
  description = "The name of the tunnel."
}

variable "tunnel_secret" {
  type        = string
  description = "The tunnel secret to connect the tunnel to Cloudflare."
}
