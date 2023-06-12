#############################################
###
### Terraform configuration for Minio
###

# Create the credentials Terraform uses to access Minio.
# This user must be manually created in Minio using the credentials in 1Password
# so that it has access for future operations.
resource "onepassword_item" "minio_terraform" {
  vault = data.onepassword_vault.homelab.uuid

  title    = "Minio user for Terraform"
  category = "login"

  username = "terraform"
  url      = "192.168.68.66:9000"

  password_recipe {
    length = 50
  }

  section {
    label = "settings"
    field {
      label = "region_name"
      value = "protea"
    }
  }
}

#############################################
###
### Longhorn
###

resource "minio_iam_user" "longhorn" {
  name = "longhorn"
}

resource "minio_s3_bucket" "longhorn" {
  bucket = "longhorn"
  acl    = "private"
}

# Create policy to allow RW access to Longhorn bucket.
resource "minio_iam_policy" "longhorn_rw" {
  name = "longhorn-rw"

  policy = jsonencode(
    {
      "Version" = "2012-10-17",
      "Statement" = [
        {
          "Effect" = "Allow",
          "Action" = [
            "s3:GetObject",
            "s3:PutObject",
            "s3:GetBucketLocation",
          ],
          "Resource" = [
            "arn:aws:s3:::${minio_s3_bucket.longhorn.bucket}"
          ]
        }
      ]
    }
  )
}

# Attach policy to Longhorn user.
resource "minio_iam_user_policy_attachment" "longhorn_user_rw" {
  user_name   = minio_iam_user.longhorn.id
  policy_name = minio_iam_policy.longhorn_rw.id
}
