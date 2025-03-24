provider "google" {
  credentials = var.gcp_credentials
  project     = var.gcp_project_id
  region      = var.region
  zone        = var.zone
}