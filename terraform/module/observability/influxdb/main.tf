resource "helm_release" "influxdb" {
  name      = "influxdb"
  namespace = var.namespace

  timeout = 600 # bit of a slowpoke on first setup

  repository = "https://helm.influxdata.com/"
  chart      = "influxdb2"
  version    = "2.1.1"

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  set {
    name  = "ingress.enabled"
    value = true
  }

  set {
    name  = "ingress.hostname"
    value = var.host
  }
}
