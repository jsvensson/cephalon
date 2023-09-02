resource "kubernetes_namespace_v1" "observability" {
  metadata {
    name = "observability"
  }
}

module "uptime_kuma" {
  source    = "./module/observability/uptime-kuma"
  namespace = kubernetes_namespace_v1.observability.metadata[0].name

  dashboard_host = "uptime.${var.domain}"
}

#module "grafana" {
#  source    = "./module/observability/grafana"
#  namespace = kubernetes_namespace_v1.observability.metadata[0].name
#
#  host = "grafana.${var.domain}"
#}


resource "kubernetes_namespace_v1" "influx" {
  metadata {
    name = "influx"
  }
}

module "influxdb" {
  source    = "./module/observability/influxdb"
  namespace = kubernetes_namespace_v1.influx.metadata[0].name

  host = "influx.${var.domain}"
}
