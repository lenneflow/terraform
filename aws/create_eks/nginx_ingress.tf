resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.11.2"
  namespace  = "kube-system"

  values = [
    file("${path.module}/ingress.yaml")
  ]

  depends_on = [ module.eks ]
}
