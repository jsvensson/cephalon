resource "helm_release" "influxdb" {
  name      = "influxdb"
  namespace = var.namespace

  timeout = 3600 # bit of a slowpoke on first setup

  repository = "https://helm.influxdata.com/"
  chart      = "influxdb2"
  version    = "2.1.1"

  set {
    name  = "persistence.size"
    value = "10Gi"
  }
}

resource "kubernetes_ingress_v1" "influxdb" {
  metadata {
    name      = "influxdb-ingress"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"

      # Hajimari dashboard config
      "hajimari.io/enable"  = true
      "hajimari.io/appName" = "InfluxDB"
      "hajimari.io/info"    = "InfluxDB dashboard"
      "hajimari.io/group"   = "Observability"
      "hajimari.io/icon"    = "mdi:chart-line"
    }
  }

  spec {
    rule {
      host = var.host

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "influx-influxdb2"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}