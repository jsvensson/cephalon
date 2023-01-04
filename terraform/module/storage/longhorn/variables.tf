variable "namespace" {
  type        = string
  description = "The Kubernetes namespace for the Longhorn deployment."
}

variable "longhorn_version" {
  type        = string
  description = "The version of Longhorn to use."
  default     = "1.4.0"
}

variable "dashboard_host" {
  type        = string
  description = "The hostname for the Longhorn dashboard."
}

variable "default_replicas" {
  type        = number
  description = "The default number of replicas for the longhorn storage class."
  default     = 3
}