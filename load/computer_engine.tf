resource "google_compute_instance" "processor_vm" {
  name         = "processor-vm"
  machine_type = "e2-micro"
  zone         = var.zone
  project      = var.project

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20210915"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = file("${path.module}/startup_aa.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.processor_vm_sa.email
    scopes = ["cloud-platform"]
  }
  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server", "https-server"]

  metadata = {
    FOOTY_KEY_NAME             = var.footy_key_name
    FOOTY_USERNAME             = var.footy_username
    PROJECT_NUMBER             = var.project_number
    AA_SINK                    = google_storage_bucket.footy_aa_sink.name
    PREP_SINK                  = google_storage_bucket.footy_prep_sink.name
    IMPORT_SINK                = google_storage_bucket.footy_stats_sink.name
    CLIMBER_STORAGE            = google_storage_bucket_object.footy_stats_sink_climbers_object.name
    PREDICTIONS_SINK           = google_storage_bucket.footy_predictions_sink.name
    PREDICTIONS_OVER_TIME_SINK = google_storage_bucket.footy_predictions_over_time_sink.name
  }
}

resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http-terraform"
  network = "default"
  project = var.project

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
}

output "ip" {
  value = "${google_compute_instance.processor_vm.network_interface.0.access_config.0.nat_ip}"
}