module "load" {
  source = "./load/"

  project                        = var.project
  location                       = var.location
  zone                           = var.zone
  branch                         = var.branch
  env_suffix                     = var.env_suffix
  cloudbuild_file                = var.cloudbuild_file
  project_number                 = var.project_number
  footy_username                 = var.footy_username
  footy_key_name                 = var.footy_key_name
  import_instance                = var.import_instance
  processor_instance             = var.processor_instance
  start_import_vm_repo           = var.start_import_vm_repo
  end_import_vm_repo             = var.end_import_vm_repo
  result_check_repo              = var.result_check_repo
  teams_import_wildcard_object   = var.teams_import_wildcard_object
  matches_import_wildcard_object = var.matches_import_wildcard_object
  appspot_sa                     = var.appspot_sa
}