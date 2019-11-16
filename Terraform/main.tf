provider "google" {
  project     = "${var.var_project}"
  credentials = "${var.var_credentials}"
}

module "pd" {
  #source  = "D:\\TC_TF\\modules\\database"
   source = "/opt/git/Learning_Ansible_containers_vsTerraform/Terraform/modules/production"
}
module "db" {
  #source  = "D:\\TC_TF\\modules\\database"
   source = "/opt/git/Learning_Ansible_containers_vsTerraform/Terraform/modules/database"
}


