##################################
# STATS IMPORT VM SERVICEACCOUNT #
##################################

resource "google_service_account" "stats_import_sa" {
  project = var.project
  account_id = "stats-import-sa"
  display_name = "Footy Stats Import Service Account"
}

resource "google_project_iam_member" "storage_admin_role_stats_import_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.stats_import_sa.email}"
  role = "roles/storage.admin"
}

resource "google_project_iam_member" "secretmanager_role_stats_import_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.stats_import_sa.email}"
  role = "roles/secretmanager.admin"
}

##################################
# TRANSFORM AA VM SERVICEACCOUNT #
##################################

resource "google_service_account" "processor_vm_sa" {
  project = var.project
  account_id = "processor-vm-sa"
  display_name = "Footy transform aa Service Account"
}

resource "google_project_iam_member" "storage_admin_role_processor_vm_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.processor_vm_sa.email}"
  role = "roles/storage.admin"
}

resource "google_project_iam_member" "bigquery_admin_role_processor_vm_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.processor_vm_sa.email}"
  role = "roles/bigquery.admin"
}

###################################
# STARTS IMPORT VM SERVICEACCOUNT #
###################################

resource "google_service_account" "starts_stats_import_sa" {
  project = var.project
  account_id = "starts-stats-import-sa"
  display_name = "Starts Footy Stats Import Service Account"
}

resource "google_project_iam_member" "compute_engine_starts_stats_import_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.stats_import_sa.email}"
  role = "roles/compute.admin"
}


################################
# END IMPORT VM SERVICEACCOUNT #
################################

resource "google_service_account" "ends_stats_import_sa" {
  project = var.project
  account_id = "ends-stats-import-sa"
  display_name = "Ends Footy Stats Import Service Account"
}

resource "google_project_iam_member" "compute_engine_ends_stats_import_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.stats_import_sa.email}"
  role = "roles/compute.admin"
}


######################
# SCHEDULER START VM #
######################
resource "google_service_account" "static_data_start_scheduler_sa" {
  account_id = "start-vm-scheduler-sa"
  project = var.project
  display_name = "Start Vm service account"
}

resource "google_project_iam_member" "cloudfunction_invoker_role_to_start_vm_scheduler_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.starts_stats_import_sa.email}"
  role = "roles/cloudfunctions.invoker"
}

####################
# SCHEDULER END VM #
####################
resource "google_service_account" "static_data_end_scheduler_sa" {
  account_id = "end-vm-scheduler-sa"
  project = var.project
  display_name = "End Vm service account"
}

resource "google_project_iam_member" "cloudfunction_invoker_role_to_end_vm_scheduler_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.ends_stats_import_sa.email}"
  role = "roles/cloudfunctions.invoker"
}

###################
# RESULT CHECK CF #
###################
resource "google_service_account" "result_check_sa" {
  project = var.project
  account_id = "result-check-sa"
  display_name = "Checks how acc. of predictions service account"
}

resource "google_project_iam_member" "storage_admin_role_result_check_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.result_check_sa.email}"
  role = "roles/storage.admin"
}

resource "google_project_iam_member" "bigquery_admin_role_result_check_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.result_check_sa.email}"
  role = "roles/bigquery.admin"
}

#############################
# SCHEDULER RESULT CHECK CF #
#############################
resource "google_service_account" "result_check_scheduler_sa" {
  account_id = "result-check-scheduler-sa"
  project = var.project
  display_name = "Result check cf service account"
}

resource "google_project_iam_member" "cloudfunction_invoker_role_to_result_check_cf_scheduler_sa" {
  project = var.project
  member = "serviceAccount:${google_service_account.result_check_scheduler_sa.email}"
  role = "roles/cloudfunctions.invoker"
}

##########################
# CLOUD RUN STATS IMPORT #
##########################
resource "google_service_account" "stats_import_cloud_run_sa" {
  project = var.project
  account_id = "stats-import2-scheduler-sa"
  display_name = "stats_import2_cloud_run_sa"
}

resource "google_cloud_run_service_iam_binding" "invoker_role_stats_import_cloud_run_sa" {
  location = var.location
  service = google_cloud_run_service.stats-import-cloudrun.name
  role = "roles/run.invoker"
  members = [
    "serviceAccount:${google_service_account.stats_import_cloud_run_sa.email}"]
}

resource "google_project_iam_binding" "secretAccessor_role_stats_import_cloud_run_sa" {
  project = var.project
  role = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.stats_import_cloud_run_sa.email}"]
}

resource "google_project_iam_binding" "storage_admin_role_stats_import_cloud_run_sa" {
  project = var.project
  role = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.stats_import_cloud_run_sa.email}"]
}