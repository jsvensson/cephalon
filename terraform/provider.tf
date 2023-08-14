terraform {
  required_version = "1.5.3"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.22.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }

    onepassword = {
      source  = "1Password/onepassword"
      version = "1.2.0"
    }

    minio = {
      source  = "aminueza/minio"
      version = "1.17.2"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.11.0"
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

provider "cloudflare" {
  api_token = onepassword_item.cloudflare_provider.password
}
