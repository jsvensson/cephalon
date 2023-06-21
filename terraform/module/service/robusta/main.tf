resource "helm_release" "robusta" {
  name      = "robusta"
  namespace = var.namespace

  repository = "https://robusta-charts.storage.googleapis.com"
  chart      = "robusta"

  values = [var.values]

  set {
    name  = "clusterName"
    value = "cortex"
  }

  set {
    name  = "enablePrometheusStack"
    value = true
  }
}

