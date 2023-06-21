variable "namespace" {
  type        = string
  description = "The Kubernetes namespace for the Robusta deployment."
}

variable "values" {
  type        = string
  description = "The raw YAML of values to pass to Helm."
}
