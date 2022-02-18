variable "project" {
  type        = string
  description = "Project id"
}

variable "location" {
  type        = string
  description = "Project location"
}

variable "zone" {
  type        = string
  description = "Project zone"
}

variable "branch" {
  type        = string
  description = "Git branch used for builds"
}

variable "project_number" {
  type        = string
  description = "Project number"
}

variable "cloudbuild_file" {
  type        = string
  description = "File used for cloudbuild"
}

variable "cloudbuild_sa" {
  type        = string
  description = "Service account used for build pipelines"
}

variable "env_suffix" {
  type = string
}

variable "footy_key_name" {
  type = string
}

variable "footy_username" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "start_import_vm_repo" {
  type = string
}

variable "end_import_vm_repo" {
  type = string
}