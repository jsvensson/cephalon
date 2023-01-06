# Add label to node 1, where the ZigStar stick is connected,
# in order to do node selection for zigbee2mqtt.
resource "kubernetes_labels" "cortex_node_1" {
  metadata {
    name = "cortex-node-1"
  }

  api_version = "v1"
  kind        = "Node"
  labels = {
    "reducer.io/usbdevice" = "zigbee-controller"
  }
}