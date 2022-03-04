###################################
## STATS IMPORT VM SERVICEACCOUNT #
###################################
#
#resource "google_service_account" "stats_import_sa" {
#  project      = var.project
#  account_id   = "stats-import-sa"
#  display_name = "Footy Stats Import Service Account"
#}
#
#resource "google_project_iam_member" "storage_admin_role_stats_import_sa" {
#  project = var.project
#  member  = "serviceAccount:${google_service_account.stats_import_sa.email}"
#  role    = "roles/storage.admin"
#}
#
#resource "google_project_iam_member" "secretmanager_role_stats_import_sa" {
#  project = var.project
#  member  = "serviceAccount:${google_service_account.stats_import_sa.email}"
#  role    = "roles/secretmanager.admin"
#}
#
####################################
## STARTS IMPORT VM SERVICEACCOUNT #
####################################
#
#resource "google_service_account" "starts_stats_import_sa" {
#  project      = var.project
#  account_id   = "starts-stats-import-sa"
#  display_name = "Starts Footy Stats Import Service Account"
#}
#
#resource "google_project_iam_member" "compute_engine_starts_stats_import_sa" {
#  project = var.project
#  member  = "serviceAccount:${google_service_account.stats_import_sa.email}"
#  role    = "roles/compute.admin"
#}
#
#
#################################
## END IMPORT VM SERVICEACCOUNT #
#################################
#
#resource "google_service_account" "ends_stats_import_sa" {
#  project      = var.project
#  account_id   = "ends-stats-import-sa"
#  display_name = "Ends Footy Stats Import Service Account"
#}
#
#resource "google_project_iam_member" "compute_engine_ends_stats_import_sa" {
#  project = var.project
#  member  = "serviceAccount:${google_service_account.stats_import_sa.email}"
#  role    = "roles/compute.admin"
#}
#
#
#######################
## SCHEDULER START VM #
#######################
#resource "google_service_account" "static_data_start_scheduler_sa" {
#  account_id   = "start-vm-scheduler-sa"
#  project      = var.project
#  display_name = "Start Vm service account"
#}
#
#resource "google_project_iam_member" "cloudfunction_invoker_role_to_start_vm_scheduler_sa" {
#  project = var.project
#  member  = "serviceAccount:${google_service_account.starts_stats_import_sa.email}"
#  role    = "roles/cloudfunctions.invoker"
#}
#
#####################
## SCHEDULER END VM #
#####################
#resource "google_service_account" "static_data_end_scheduler_sa" {
#  account_id   = "end-vm-scheduler-sa"
#  project      = var.project
#  display_name = "End Vm service account"
#}
#
#resource "google_project_iam_member" "cloudfunction_invoker_role_to_end_vm_scheduler_sa" {
#  project = var.project
#  member  = "serviceAccount:${google_service_account.ends_stats_import_sa.email}"
#  role    = "roles/cloudfunctions.invoker"
#}