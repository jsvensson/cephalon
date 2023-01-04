terraform {
  required_version = ">= 1.1"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.16.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.8.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
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