resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = kubernetes_namespace.argocd.metadata[0].name

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  # 🔒 Fixed chart version (as requested)
  version = "9.1.8"

  values = [
    file("${path.module}/values-argocd.yaml")
  ]

  wait    = true
  timeout = 600

  force_update  = true
  recreate_pods = true

  depends_on = [
    kubernetes_namespace.argocd
  ]
}
