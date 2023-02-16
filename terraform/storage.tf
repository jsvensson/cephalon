resource "kubernetes_namespace_v1" "longhorn_system" {
  metadata {
    name = "longhorn-system"
  }
}

module "longhorn" {
  source    = "./module/storage/longhorn"
  namespace = kubernetes_namespace_v1.longhorn_system.metadata[0].name

  dashboard_host   = "longhorn.${var.domain}"
  default_replicas = 1
}

# Create a storage class that only uses a single replica
# DEPRECATED: Only used for legacy PVs from when I only had a single drive.
resource "kubernetes_storage_class_v1" "longhorn_single_replica" {
  metadata {
    name = "longhorn-single-replica"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = false
    }
  }

  storage_provisioner    = "driver.longhorn.io"
  allow_volume_expansion = true
  reclaim_policy         = "Delete"
  volume_binding_mode    = "Immediate"

  parameters = {
    numberOfReplicas    = 2
    fsType              = "ext4"
    staleReplicaTimeout = 30
    dataLocality        = "disabled"
    fromBackup          = ""
  }
}

resource "kubernetes_storage_class_v1" "longhorn_replica" {
  metadata {
    name = "longhorn-replica"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = true
    }
  }

  storage_provisioner    = "driver.longhorn.io"
  allow_volume_expansion = true
  reclaim_policy         = "Delete"
  volume_binding_mode    = "Immediate"

  parameters = {
    numberOfReplicas    = 2
    fsType              = "ext4"
    staleReplicaTimeout = 30
    dataLocality        = "disabled"
    fromBackup          = ""
  }
}

# Daily snapshot, kept for 7d
resource "kubernetes_manifest" "longhorn_snapshot_daily" {
  manifest = {
    apiVersion = "longhorn.io/v1beta1"
    kind       = "RecurringJob"
    metadata = {
      name      = "longhorn-snapshot-daily"
      namespace = kubernetes_namespace_v1.longhorn_system.metadata[0].name
    }

    spec = {
      task        = "snapshot"
      cron        = "0 3 * * ?" # 03:00 every day
      retain      = 7
      concurrency = 2
      groups = [
        "default",
        "snapshot-daily",
      ]
    }
  }
}

# Hourly snapshot, kept for 48h
resource "kubernetes_manifest" "longhorn_snapshot_hourly" {
  manifest = {
    apiVersion = "longhorn.io/v1beta1"
    kind       = "RecurringJob"
    metadata = {
      name      = "longhorn-snapshot-hourly"
      namespace = kubernetes_namespace_v1.longhorn_system.metadata[0].name
    }

    spec = {
      task        = "snapshot"
      cron        = "0 * * * ?" # Every hour, on the hour
      retain      = 48          # Keep the last two days of snapshots
      concurrency = 2
      groups = [
        "snapshot-hourly",
      ]
    }
  }
}