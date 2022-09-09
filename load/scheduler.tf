resource "google_cloud_scheduler_job" "start_vm_scheduler" {
  name             = "static_data_start_import_scheduler"
  description      = "Triggers the start vm Cloud Function to start vm"
  schedule         = "45 12 * * 2,5"
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
    body        = base64encode("{\"type\":\"import\"}")

    headers = {
      Content-Type = "application/json"
    }

    # see here how body must look like
    # https://www.reddit.com/r/googlecloud/comments/lrv9eo/cant_pass_any_arguments_to_a_workflow_when_using/
    oidc_token {
      service_account_email = google_service_account.starts_stats_import_sa.email
    }
  }
}

resource "google_cloud_scheduler_job" "end_vm_scheduler" {
  name             = "static_data_end_import_scheduler"
  description      = "Triggers the end vm Cloud Function to start vm"
  schedule         = "0 14 * * MON-FRI"
  time_zone        = "Europe/Berlin"
  region           = var.location
  attempt_deadline = "540s"
  project          = var.project

  retry_config {
    retry_count = 0
  }

  http_target {
    http_method = "POST"
    uri         = "https://${var.location}-${var.project}.cloudfunctions.net/${google_cloudfunctions_function.EndServer.name}"
    body        = base64encode("{\"type\":\"import\"}")

    headers = {
      Content-Type = "application/json"
    }

    # see here how body must look like
    # https://www.reddit.com/r/googlecloud/comments/lrv9eo/cant_pass_any_arguments_to_a_workflow_when_using/
    oidc_token {
      service_account_email = google_service_account.ends_stats_import_sa.email
    }
  }
}

resource "google_cloud_scheduler_job" "start_processor_vm_scheduler" {
  name             = "start_processor_vm_scheduler"
  description      = "Triggers the start vm processor Cloud Function"
  schedule         = "45 16 * * 5"
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
    body        = base64encode("{\"type\":\"processor\"}")

    headers = {
      Content-Type = "application/json"
    }

    # see here how body must look like
    # https://www.reddit.com/r/googlecloud/comments/lrv9eo/cant_pass_any_arguments_to_a_workflow_when_using/
    oidc_token {
      service_account_email = google_service_account.starts_stats_import_sa.email
    }
  }
}

resource "google_cloud_scheduler_job" "end_processor_vm_scheduler" {
  name             = "end_processor_vm_scheduler"
  description      = "Triggers the end processor vm Cloud Function"
  schedule         = "0 18 * * MON-FRI"
  time_zone        = "Europe/Berlin"
  region           = var.location
  attempt_deadline = "540s"
  project          = var.project

  retry_config {
    retry_count = 0
  }

  http_target {
    http_method = "POST"
    uri         = "https://${var.location}-${var.project}.cloudfunctions.net/${google_cloudfunctions_function.EndServer.name}"
    body        = base64encode("{\"type\":\"processor\"}")

    headers = {
      Content-Type = "application/json"
    }

    # see here how body must look like
    # https://www.reddit.com/r/googlecloud/comments/lrv9eo/cant_pass_any_arguments_to_a_workflow_when_using/
    oidc_token {
      service_account_email = google_service_account.ends_stats_import_sa.email
    }
  }
}


resource "google_cloud_scheduler_job" "result_check_scheduler" {
  name             = "result_check_scheduler"
  description      = "Checks if predictions were correct or not."
  schedule         = "45 16 * * 2"
  time_zone        = "Europe/Berlin"
  region           = var.location
  attempt_deadline = "540s"
  project          = var.project

  retry_config {
    retry_count = 0
  }

  http_target {
    http_method = "POST"
    uri         = "https://${var.location}-${var.project}.cloudfunctions.net/${google_cloudfunctions_function.ResultCheck.name}"
    headers     = {
      Content-Type = "application/json"
    }
    oidc_token {
      service_account_email = google_service_account.result_check_scheduler_sa.email
    }
  }
}

resource "google_cloud_scheduler_job" "load_footy_import_scheduler" {
  name             = "load_footy_import_scheduler"
  description      = "Triggers load_footy_import cloud run service"
  schedule         = "45 16 * * 2"
  time_zone        = "Europe/Berlin"
  region           = var.location
  attempt_deadline = "1800s"
  project          = var.project

  retry_config {
    retry_count = 0
  }

  http_target {
    http_method = "GET"
    uri         = var.load_footy_import_url
    headers = {
      Content-Type = "application/json"
    }
    # see here how body must look like
    # https://www.reddit.com/r/googlecloud/comments/lrv9eo/cant_pass_any_arguments_to_a_workflow_when_using/
    oidc_token {
      service_account_email = google_service_account.load_footy_import_sa.email
    }
  }
}
