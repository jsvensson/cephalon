# Namespace for IOT frontend services.
resource "kubernetes_namespace_v1" "iot_frontend" {
  metadata {
    name = "iot-frontend"
  }
}
