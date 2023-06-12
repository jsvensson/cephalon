# Namespace for IOT backend services.
resource "kubernetes_namespace_v1" "iot_backend" {
  metadata {
    name = "iot-backend"
  }
}

module "mosquitto" {
  source    = "./module/iot-backend/mosquitto"
  namespace = kubernetes_namespace_v1.iot_backend.metadata[0].name

  mosquitto_version = "2.0.15"
  mosquitto_conf    = "./data/mosquitto/mosquitto.conf"
}

module "zigbee2mqtt" {
  source    = "./module/iot-backend/zigbee2mqtt"
  namespace = kubernetes_namespace_v1.iot_backend.metadata[0].name

  # Hostname for z2m dashboard
  ui_host = "z2m.${var.domain}"

  # Read as template
  values = templatefile("./data/zigbee2mqtt/values.yaml", {
    "usb_path"    = "/dev/ttyUSB0"
    "network_key" = onepassword_item.z2m_secrets.section[0].field[0].value
  })
}

resource "onepassword_item" "z2m_secrets" {
  vault    = data.onepassword_vault.homelab.uuid
  category = "password"
  title    = "Zigbee2MQTT secrets"

  section {
    label = "Secrets"

    field {
      label = "Network key"
    }
  }
}
