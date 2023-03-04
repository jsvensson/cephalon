terraform {
  required_version = ">= 1.1"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.18.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }

    onepassword = {
      source  = "1Password/onepassword"
      version = "1.1.4"
    }

    minio = {
      source  = "aminueza/minio"
      version = "1.12.0"
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

provider "onepassword" {
  url = "http://1password-connect.cortex.reducer.io"
}

provider "minio" {
  minio_region   = onepassword_item.minio_terraform.section[0].field[0].value
  minio_server   = onepassword_item.minio_terraform.url
  minio_user     = onepassword_item.minio_terraform.username
  minio_password = onepassword_item.minio_terraform.password
}
