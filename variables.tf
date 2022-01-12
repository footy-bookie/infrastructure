variable "project" {
  type        = string
  description = "Project id"
}

variable "location" {
  type        = string
  description = "Project location"
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