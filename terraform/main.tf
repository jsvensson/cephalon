locals {
  domain = "cortex.reducer.io"
}

module "n8n" {
  source    = "./module/service/n8n"
  namespace = "default"
}