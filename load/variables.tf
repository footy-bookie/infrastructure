variable "project" {
  type = string
}

variable "project_number" {
  type        = string
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
  type        = string
  description = "File used for cloudbuild"
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
