variable "project" {
  type = string
}

variable "location" {
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