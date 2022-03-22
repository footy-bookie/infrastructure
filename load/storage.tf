resource "google_storage_bucket" "footy_stats_sink" {
  name     = "${var.env_suffix}-footy_stats_sink_dev"
  location = var.location
  project  = var.project
}

resource "google_storage_bucket_object" "footy_stats_sink_climbers_object" {
  bucket  = google_storage_bucket.footy_stats_sink.name
  content = "Folder for climbers files"
  name    = "climbers/"
}

resource "google_storage_bucket" "footy_aa_sink" {
  name     = "${var.env_suffix}-footy_aa_sink_dev"
  location = var.location
  project  = var.project
}

resource "google_storage_bucket" "footy_prep_sink" {
  name     = "${var.env_suffix}-footy_prep_sink"
  location = var.location
  project  = var.project
}

resource "google_storage_bucket" "footy_predictions_sink" {
  name     = "${var.env_suffix}-footy_predictions_sink"
  location = var.location
  project  = var.project
}

resource "google_storage_bucket" "footy_predictions_over_time_sink" {
  name     = "${var.env_suffix}-footy_predictions_over_time_sink"
  location = var.location
  project  = var.project
}