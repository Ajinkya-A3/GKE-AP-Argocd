output "namespace" {
  value = kubernetes_namespace.argocd.metadata[0].name
}

output "helm_release_name" {
  value = helm_release.argocd.name
}

output "chart_version" {
  value = helm_release.argocd.version
}
