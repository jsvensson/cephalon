resource "kubernetes_deployment_v1" "whoami" {
  metadata {
    name = "whoami"
  }

  spec {
    selector {
      match_labels = {
        app = "whoami"
      }

    }

    replicas = 1

    template {
      metadata {
        labels = {
          app = "whoami"
        }
      }
      spec {
        container {
          name              = "whoami"
          image             = "containous/whoami:v1.5.0"
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "whoami" {
  metadata {
    name = "whoami"
  }

  spec {
    type = "ClusterIP"

    selector = {
      app = "whoami"
    }

    port {
      port        = 5678
      target_port = 80
    }
  }
}

resource "kubernetes_ingress_v1" "whoami" {
  metadata {
    name = "whoami"

    annotations = {
      "kubernetes.io/ingress.class" = "traefik"
    }
  }

  spec {
    rule {
      host = "whoami.${var.domain}"

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "whoami"
              port {
                number = 5678
              }
            }
          }
        }
      }
    }
  }
}