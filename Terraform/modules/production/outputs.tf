output "pd_external_ip" {
  value = "${google_compute_instance.pd.network_interface.0.access_config.0.nat_ip}"
}

output "pd_internal_ip" {
  value = "${google_compute_instance.pd.network_interface.0.network_ip}"
}

output "pd_name" {
  value = "${google_compute_instance.pd.name}"
}

output "pd_zone" {
  value = "${google_compute_instance.pd.zone}"
}

output "pd_project" {
  value = "${google_compute_instance.pd.project}"
}

