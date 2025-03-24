variable "gcp_project_id" {
  description = "GCP project-id"
  type        = string
}

variable "region" {
  description = "Region where the instance will be created"
  type        = string
}

variable "zone" {
  description = "Zone within the selected region"
  type        = string
}