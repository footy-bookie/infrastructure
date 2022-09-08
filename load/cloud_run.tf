########################
# Enable Cloud Run API #
########################
resource "google_project_service" "run_api" {
  service = "run.googleapis.com"
  disable_on_destroy = true
}

resource "google_cloud_run_service" "stats-import-cloudrun" {
  name = "stats-importer"
  location = var.location
  project = var.project

  template {
    spec {
      service_account_name = var.stats_import_cloud_run_sa
      containers {
        image = var.stats_import_image
        env {
          name = "FOOTY_KEY"
          value_from {
            secret_key_ref {
              name = "footy_key"
              key = "1"
            }
          }
        }
        env {
          name = "FOOTY_USERNAME"
          value = "nichohelmut"
        }
        env {
          name = "SINK"
          value = "dev-footy_stats_sink_dev"
        }
      }
    }
  }

  metadata {
    annotations = {
      generated-by = "magic-modules"
    }
  }
  traffic {
    percent = 100
    latest_revision = true
  }

  depends_on = [
    google_project_service.run_api]
}

