# Add label to node where the ZigStar stick is connected,
# in order to do node selection for zigbee2mqtt.
resource "kubernetes_labels" "cephalon_agent_1" {
  metadata {
    name = "cephalon-agent-1"
  }

  api_version = "v1"
  kind        = "Node"
  labels = {
    "reducer.io/usbdevice" = "zigbee-controller"
  }
}