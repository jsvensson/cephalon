terraform {
  required_version = ">= 1.1"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.17.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "cortex"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}