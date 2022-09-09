variable "project" {
  type = string
}

variable "project_number" {
  type = string
  description = "Project number"
}

variable "location" {
  type = string
}

variable "zone" {
  type = string
}

variable "branch" {
  type = string
}

variable "env_suffix" {
  type = string
}

variable "cloudbuild_file" {
  type = string
  description = "File used for cloudbuild"
}

variable "footy_key_name" {
  type = string
}

variable "footy_username" {
  type = string
}

variable "import_instance" {
  type = string
}

variable "processor_instance" {
  type = string
}

variable "start_import_vm_repo" {
  type = string
}

variable "end_import_vm_repo" {
  type = string
}

variable "result_check_repo" {
  type = string
}

variable "stats_import_repo" {
  type = string
}

variable "teams_import_wildcard_object" {
  type = string
}

variable "matches_import_wildcard_object" {
  type = string
}

variable "appspot_sa" {
  type = string
}

variable "stats_import_cloud_run_sa" {
  type = string
}

variable "stats_import_image" {
  type = string
}

variable "load_footy_import_url" {
  type = string
}