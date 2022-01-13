##################################
# STATS IMPORT VM SERVICEACCOUNT #
##################################

resource "google_service_account" "stats_import_sa" {
  project      = var.project
  account_id   = "stats-import-sa"
  display_name = "Footy Stats Import Service Account"
}

resource "google_project_iam_member" "storage_admin_role_stats_import_sa" {
  project = var.project
  member  = "serviceAccount:${google_service_account.stats_import_sa.email}"
  role    = "roles/storage.admin"
}

resource "google_project_iam_member" "secretmanager_role_stats_import_sa" {
  project = var.project
  member  = "serviceAccount:${google_service_account.stats_import_sa.email}"
  role    = "roles/secretmanager.admin"
}