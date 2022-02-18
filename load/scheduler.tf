resource "google_cloud_scheduler_job" "start_vm_scheduler" {
  name             = "static_data_import_scheduler"
  description      = "Triggers the start vm Cloud Function to start vm"
  schedule         = "0 1 * * *"
  time_zone        = "Europe/Berlin"
  region           = var.location
  attempt_deadline = "540s"
  project          = var.project

  retry_config {
    retry_count = 0
  }

  http_target {
    http_method = "POST"
    uri         = "https://${var.location}-${var.project}.cloudfunctions.net/${google_cloudfunctions_function.StartServer.name}"

    # see here how body must look like
    # https://www.reddit.com/r/googlecloud/comments/lrv9eo/cant_pass_any_arguments_to_a_workflow_when_using/
    oidc_token {
      service_account_email = google_service_account.starts_stats_import_sa.email
    }
  }
}