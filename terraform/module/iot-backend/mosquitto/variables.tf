variable "namespace" {
  type        = string
  description = "The Kubernetes namespace for the Mosquitto deployment."
}

variable "mosquitto_version" {
  type        = string
  description = "The version of Mosquitto to use."
  default     = "2.0.15"
}

variable "mqtt_port" {
  type        = number
  description = "The port to use for MQTT."
  default     = 1883
}

variable "mosquitto_conf" {
  type        = string
  description = "The path to the mosquitto.conf file."
}