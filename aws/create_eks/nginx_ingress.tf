# NGINX Ingress Controller using Helm
resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.11.2"
  namespace  = "kube-system"

  values = [
    file("${path.module}/values.yaml")  # Define your custom values for the ingress here.
  ]

  depends_on = [ module.eks ]
}
