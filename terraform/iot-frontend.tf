# Namespace for IOT frontend services.
resource "kubernetes_namespace_v1" "iot_frontend" {
  metadata {
    name = "iot-frontend"
  }
}

module "node_red" {
  source    = "./module/iot-frontend/node-red"
  namespace = kubernetes_namespace_v1.iot_frontend.metadata.0.name

  ui_host = "nodered.${var.domain}"
}