resource "kubernetes_deployment" "nginx" {
  metadata {
    name = var.function_name
    labels = {
      App = var.function_name
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = var.function_name
      }
    }
    template {
      metadata {
        labels = {
          App = var.function_name
        }
      }
      spec {
        container {
          image = var.image_name
          name  = "admin"

        port {
            container_port = var.container_port
            host_port = var.host_port
          }    

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
