module "load" {
  source = "./load/"

  project                                       = var.project
  location                                      = var.location
  branch                                        = var.branch
  env_suffix                                    = var.env_suffix
  cloudbuild_file                               = var.cloudbuild_file
}