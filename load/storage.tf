resource "google_storage_bucket" "footy_stats_sink" {
  name     = "${var.env_suffix}-footy_stats_sink"
  location = var.location
  project  = var.project
}