resource "kubernetes_service" "nginx" {
  metadata {
    name = var.function_name
  }
  spec {
    selector = {
      App = kubernetes_deployment.nginx.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = var.container_port
      target_port = var.container_port
    }

    type = "LoadBalancer"
  }
}
