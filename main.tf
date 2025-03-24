resource "google_compute_instance" "open-telemetry-project" {
  boot_disk {
    auto_delete = true
    device_name = "open-telemetry-project"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20250312"
      size  = 15
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = true
  deletion_protection = true
  enable_display      = false

  labels = {
    goog-ec-src           = "vm_add-tf"
    goog-ops-agent-policy = "v2-x86-template-1-4-0"
  }

  machine_type = "e2-highmem-2"

  metadata = {
    enable-osconfig = "TRUE"
  }

  name = "open-telemetry-project"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/personal-projects-1702/regions/us-central1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server"]
  zone = "us-central1-a"
}
