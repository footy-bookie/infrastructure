###########################
# VM START CLOUD FUNCTION #
###########################
resource "google_cloudfunctions_function" "StartServer" {
  name                  = "StartServer"
  description           = "Starts footy import vm"
  runtime               = "python39"
  project               = var.project
  available_memory_mb   = 1024
  timeout               = 30
  trigger_http          = true
  max_instances         = 5
  entry_point           = "main"
  region                = var.location
  # invocation service account or ingress_settings = "ALLOW_INTERNAL_ONLY" setting,not both
  service_account_email = "footy-dev-343115@appspot.gserviceaccount.com"
  # make sure that paths (currently src) is the same in here and in the corresponding cloud build trigger
  source_repository {
    url = "https://source.developers.google.com/projects/${var.project}/repos/${var.start_import_vm_repo}/moveable-aliases/${var.branch}/paths/src"
  }

  environment_variables = {
    PROJECT_NUMBER     = var.project_number
    IMPORT_INSTANCE    = var.import_instance
    PROCESSOR_INSTANCE = var.processor_instance
    INSTANCE_ZONE      = var.zone
  }
}

#########################
# VM END CLOUD FUNCTION #
#########################
resource "google_cloudfunctions_function" "EndServer" {
  name                  = "EndServer"
  description           = "End footy import vm"
  runtime               = "python39"
  project               = var.project
  available_memory_mb   = 1024
  timeout               = 30
  trigger_http          = true
  max_instances         = 5
  entry_point           = "main"
  region                = var.location
  # invocation service account or ingress_settings = "ALLOW_INTERNAL_ONLY" setting,not both
  service_account_email = "footy-dev-343115@appspot.gserviceaccount.com"
  # make sure that paths (currently src) is the same in here and in the corresponding cloud build trigger
  source_repository {
    url = "https://source.developers.google.com/projects/${var.project}/repos/${var.end_import_vm_repo}/moveable-aliases/${var.branch}/paths/src"
  }

  environment_variables = {
    PROJECT_NUMBER     = var.project_number
    IMPORT_INSTANCE    = var.import_instance
    PROCESSOR_INSTANCE = var.processor_instance
    INSTANCE_ZONE      = var.zone
  }
}

###############################
# RESULT CHECK CLOUD FUNCTION #
###############################
resource "google_cloudfunctions_function" "ResultCheck" {
  name                  = "ResultCheck"
  description           = "Checks and saves result from predictions made"
  runtime               = "python39"
  project               = var.project
  available_memory_mb   = 1024
  timeout               = 30
  trigger_http          = true
  max_instances         = 5
  entry_point           = "main"
  region                = var.location
  # invocation service account or ingress_settings = "ALLOW_INTERNAL_ONLY" setting,not both
  service_account_email = google_service_account.result_check_sa.email
  # make sure that paths (currently src) is the same in here and in the corresponding cloud build trigger
  source_repository {
    url = "https://source.developers.google.com/projects/${var.project}/repos/${var.result_check_repo}/moveable-aliases/${var.branch}/paths/src"
  }

  environment_variables = {
    PROJECT_NUMBER              = var.project_number
    RESULT_CHECK_OVER_TIME_SINK = google_storage_bucket.footy_result_check_over_time_sink.name
    TOTAL_RESULT_CHECK_BQ       = google_bigquery_table.total_result_check.table_id
  }
}