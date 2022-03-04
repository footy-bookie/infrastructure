############################
## VM START CLOUD FUNCTION #
############################
#resource "google_cloudfunctions_function" "StartServer" {
#  name                  = "StartServer"
#  description           = "Starts footy import vm"
#  runtime               = "python39"
#  project               = var.project
#  available_memory_mb   = 1024
#  timeout               = 30
#  trigger_http          = true
#  max_instances         = 5
#  entry_point           = "main"
#  region                = var.location
#  # invocation service account or ingress_settings = "ALLOW_INTERNAL_ONLY" setting,not both
#  service_account_email = "fake-client-project@appspot.gserviceaccount.com"
#  # make sure that paths (currently src) is the same in here and in the corresponding cloud build trigger
#  source_repository {
#    url = "https://source.developers.google.com/projects/${var.project}/repos/${var.start_import_vm_repo}/moveable-aliases/${var.branch}/paths/src"
#  }
#
#  environment_variables = {
#    PROJECT_NUMBER = var.project_number
#    INSTANCE_NAME  = var.instance_name
#    INSTANCE_ZONE  = var.zone
#  }
#}
#
##########################
## VM END CLOUD FUNCTION #
##########################
#resource "google_cloudfunctions_function" "EndServer" {
#  name                  = "EndServer"
#  description           = "End footy import vm"
#  runtime               = "python39"
#  project               = var.project
#  available_memory_mb   = 1024
#  timeout               = 30
#  trigger_http          = true
#  max_instances         = 5
#  entry_point           = "main"
#  region                = var.location
#  # invocation service account or ingress_settings = "ALLOW_INTERNAL_ONLY" setting,not both
#  service_account_email = "fake-client-project@appspot.gserviceaccount.com"
#  # make sure that paths (currently src) is the same in here and in the corresponding cloud build trigger
#  source_repository {
#    url = "https://source.developers.google.com/projects/${var.project}/repos/${var.end_import_vm_repo}/moveable-aliases/${var.branch}/paths/src"
#  }
#
#  environment_variables = {
#    PROJECT_NUMBER = var.project_number
#    INSTANCE_NAME  = var.instance_name
#    INSTANCE_ZONE  = var.zone
#  }
#}