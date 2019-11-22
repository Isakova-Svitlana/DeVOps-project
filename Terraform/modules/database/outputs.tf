output "db_external_ip" {
  value = "${google_compute_instance.mgdb.network_interface.0.access_config.0.nat_ip}"
}

output "db_internal_ip" {
  value = "${google_compute_instance.mgdb.network_interface.0.network_ip}"
}

output "db_name" {
  value = "${google_compute_instance.mgdb.name}"
}
output "db_zone" {
  value = "${google_compute_instance.mgdb.zone}"
}
output "db_project" {
  value = "${google_compute_instance.mgdb.project}"
}