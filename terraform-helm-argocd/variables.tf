variable "namespace" {
    description = "name for the namespace"
    type        = string    
    default     = "argocd"
}

variable "chart_version" {
    description = "version of the chart to deploy"
    type        = string    
    default     = "9.1.8"
}

variable "values_path" {
    description = "path to the values file"
    type        = string    
    default     = "./values-argocd.yaml"
}