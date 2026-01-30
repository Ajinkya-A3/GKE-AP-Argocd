resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = kubernetes_namespace_v1.argocd.metadata[0].name

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  # 🔒 Fixed chart version (as requested)
  version = var.chart_version

  values = [
    file(var.values_path)
  ]

  wait    = true
  timeout = 600

  force_update  = true
  recreate_pods = true

  depends_on = [
    kubernetes_namespace_v1.argocd
  ]
}
