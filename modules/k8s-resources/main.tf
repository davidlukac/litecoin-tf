resource "kubernetes_namespace" "ns" {
  for_each = var.namespaces

  metadata {
    name = each.value
    annotations = {
      provisioner = "terraform"
    }
  }
}

// Static provisioning of the storage, normally we would have either some dynamic storage provisioner, or provide the
// storage requirements for the PVs and storage classes as module input.
resource "kubernetes_persistent_volume" "litecoin-data" {
  count = 2

  metadata {
    name = "litecoin-data-${count.index}"

    annotations = {
      provisioner = "terraform"
    }

    labels = {
      type = "local"
    }
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    capacity = {
      storage = "1Gi"
    }

    persistent_volume_reclaim_policy = "Retain"

    storage_class_name = "host-storage"

    persistent_volume_source {
      host_path {
        path = "${var.data-root}/${count.index}"
      }
    }
  }
}

resource "kubernetes_secret" "litecoin" {
  metadata {
    name = "litecoin"

    annotations = {
      provisioner = "terraform"
    }

    namespace = "litecoin"
  }

  type = "Opaque"
  data = {
    // Normally the secrets would be managed in some kind of Vault.
    "litecoin.conf" = file("${path.cwd}/resources/secret/litecoin.conf")
  }
}
