provider "google" {
  project     = "${var.var_project}"
  credentials = "${var.var_credentials}"
}

module "pd" {
  #source  = "D:\\TC_TF\\modules\\database"
   source = "Terraform/modules/production"
}
module "db" {
  #source  = "D:\\TC_TF\\modules\\database"
   source = "Terraform/modules/database"
}


