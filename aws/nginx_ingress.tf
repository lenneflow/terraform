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

data "kubernetes_service" "nginx_ingress" {
  metadata {
    name = "nginx-ingress-ingress-nginx-controller"
    namespace = helm_release.nginx_ingress.metadata[0].namespace
  }
}

resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  depends_on = [module.eks ]
  namespace  = "metrics-server"
  create_namespace = true
  set {
    name  = "args"
    value = "{--kubelet-insecure-tls=true}"
  }
  wait = true
}

