resource "google_cloudbuild_trigger" "start_server_trigger" {
  project = var.project

  trigger_template {
    branch_name = var.branch
    repo_name   = var.start_import_vm_repo
  }

  substitutions = {
    _REPOSITORY_NAME     = var.start_import_vm_repo
    _BRANCH_NAME         = var.branch
    #must be same branch as in trigger template
    _PATH                = "src"
    _LOCATION            = var.location
    _CLOUD_FUNCTION_NAME = google_cloudfunctions_function.StartServer.name
    _PYTHON_VERSION      = google_cloudfunctions_function.StartServer.runtime
  }

  filename = "cloudbuild.yaml"
  name     = "start-server-trigger"
}

resource "google_cloudbuild_trigger" "end_server_trigger" {
  project = var.project

  trigger_template {
    branch_name = var.branch
    repo_name   = var.end_import_vm_repo
  }

  substitutions = {
    _REPOSITORY_NAME     = var.end_import_vm_repo
    _BRANCH_NAME         = var.branch
    #must be same branch as in trigger template
    _PATH                = "src"
    _LOCATION            = var.location
    _CLOUD_FUNCTION_NAME = google_cloudfunctions_function.EndServer.name
    _PYTHON_VERSION      = google_cloudfunctions_function.EndServer.runtime
  }

  filename = "cloudbuild.yaml"
  name     = "end-server-trigger"
}