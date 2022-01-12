module "load" {
  source = "./load/"

  project                                       = var.project
  location                                      = var.location
  branch                                        = var.branch
}