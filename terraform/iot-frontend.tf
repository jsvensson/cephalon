# Namespace for IOT frontend services.
resource "kubernetes_namespace_v1" "iot_frontend" {
  metadata {
    name = "iot-frontend"
  }
}

#module "node_red" {
#  source    = "./module/iot-frontend/node-red"
#  namespace = kubernetes_namespace_v1.iot_frontend.metadata.0.name
#
#  pvc_name = kubernetes_persistent_volume_claim_v1.node_red_data.metadata.0.name
#  ui_host  = "nodered.cortex.reducer.io"
#}

#resource "kubernetes_persistent_volume_claim_v1" "node_red_data" {
#  metadata {
#    name      = "node-red-data"
#    namespace = kubernetes_namespace_v1.iot_frontend.metadata.0.name
#  }
#
#  spec {
#    storage_class_name = "longhorn-single-replica"
#    access_modes       = ["ReadWriteOnce"]
#
#    resources {
#      requests = {
#        storage = "100Mi"
#      }
#    }
#  }
#}

