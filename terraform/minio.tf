# Create the credentials Terraform uses to access Minio.
resource "onepassword_item" "minio_terraform" {
  vault = var.onepassword_vault_id

  title    = "Minio user for Terraform"
  category = "login"

  username = "terraform"

  password_recipe {
    length = 50
  }
}
