resource "google_compute_instance" "mgdb" {
  name         = "${format("%s","${var.var_name}")}"
  machine_type  = "custom-4-6144"
  zone          =   "${format("%s","${var.var_region}-a")}"
  tags          = ["http-server","https-server","mgdb-27017","kibana","elastic"]

  boot_disk {
    initialize_params {
      image     =  "centos-7-v20190905"   
      type = "pd-standard"  
      size = "100"
    }
  }    

network_interface {
    network            = "${var.var_network}"
    subnetwork         = "${var.var_subnetwork}"
    subnetwork_project = "${var.var_subnetwork_project}"
    network_ip         = "${var.var_network_ip}"

    access_config {
            nat_ip  = "${var.var_nat_ip}"
    }
} 
metadata = {
    ssh-keys = "isakovasvitlana:${file(var.public_key_path2)}"  
  } 
}
resource "null_resource" "mgdb_prov" {
  
  depends_on = [google_compute_instance.mgdb]

# connection for the work of service providers after installing and configuring the OS
  connection {
    host        = "${google_compute_instance.mgdb.network_interface.0.access_config.0.nat_ip}"
    type        = "ssh"
    user        = "isakovasvitlana"
    agent       = false
    private_key = "${file(var.private_key_path2)}"
  }

  provisioner "file" {
    source      = "modules/database/db-keys.sh"
    destination = "/home/isakovasvitlana/db-keys.sh"   
 }  
#  provisioner "file" {
#    source      = "modules/database/docker.sh"
#    destination = "/home/isakovasvitlana/docker.sh"   
# }  
 provisioner "file" {
    source      = "/home/buildagent/keys/bs_db.pub"
    destination = "/home/isakovasvitlana/bs_db.pub"   
 }
  
  provisioner "remote-exec" {

    inline = [
      "sudo chmod +x /home/isakovasvitlana/db-keys.sh",
      "sudo /bin/bash /home/isakovasvitlana/db-keys.sh"
    ]
  }
}
