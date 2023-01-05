variable "namespace" {
  type        = string
  description = "The Kubernetes namespace for the Node-RED deployment."
}

variable "node_red_version" {
  type        = string
  description = "The version of Node-RED to use."
  default     = "2.2.3"
}

variable "ui_host" {
  type        = string
  description = "The hostname to use for the Node-RED dashboard."
}


variable "port" {
  type        = number
  description = "The port to use for Node-RED."
  default     = 1880
}