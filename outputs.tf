output "subnet" {
  value = "${google_compute_subnetwork.alpha_subnet.self_link}"
}

output "subnet_name" {
  value = "${var.role}-${var.gc_zone}-${random_id.id.hex}"
}

output "subnet_cidr" {
  value = "${var.subnet_cidr}"
}

output "network" {
  value = "${google_compute_network.alpha_network.self_link}"
}

output "network_name" {
  value = "${var.role}-${var.gc_zone}-${random_id.id.hex}"
}

output "gc_region" {
  value = "${var.gc_region}"
}

output "gc_zone" {
  value = "${var.gc_zone}"
}

output "google_project" {
  value = "${var.google_project}"
}
