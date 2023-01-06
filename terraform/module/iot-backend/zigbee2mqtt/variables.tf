variable "namespace" {
  type        = string
  description = "The Kubernetes namespace for the zigbee2mqtt deployment."
}

variable "chart_version" {
  type        = string
  description = "The Helm release version to use."
}

variable "values" {
  type        = string
  description = "values (as YAML) to pass to Helm"
}

variable "ui_host" {
  type        = string
  description = "The hostname to use for the dashboard."
}