locals {
  chart_version = "9.4.2"

  # k8s-at-home repo is no longer maintained. Override z2m version in chart.
  z2m_version = "1.30.0"
}

resource "helm_release" "zigbee2mqtt" {
  name      = "zigbee2mqtt"
  namespace = var.namespace

  repository = "https://k8s-at-home.com/charts/"
  chart      = "zigbee2mqtt"
  version    = local.chart_version
  values     = [var.values]

  # Override image tag version from chart
  set {
    name  = "image.tag"
    value = local.z2m_version
  }
}

resource "kubernetes_ingress_v1" "zigbee2mqtt_ingress" {
  metadata {
    name      = "zigbee2mqtt-ingress"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"

      # Hajimari dashboard config
      "hajimari.io/enable"  = true
      "hajimari.io/appName" = "zigbee2mqtt"
      "hajimari.io/info"    = "zigbee2mqtt dashboard"
      "hajimari.io/group"   = "IoT"
      "hajimari.io/icon"    = "mdi:zigbee"
    }
  }

  spec {
    rule {
      host = var.ui_host

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "zigbee2mqtt"
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}