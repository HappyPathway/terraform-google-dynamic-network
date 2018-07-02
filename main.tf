resource "random_id" "subnet_id" {
  byte_length = 8
}

resource "random_id" "id" {
  byte_length = 8
}

resource "google_compute_network" "alpha_network" {
  name                    = "${var.role}-${var.gc_zone}-${random_id.id.hex}"
  # auto_create_subnetworks = "true"
}

resource "google_compute_subnetwork" "alpha_subnet" {
  name          = "${var.role}-${var.gc_zone}-${random_id.subnet_id.hex}"
  ip_cidr_range = "${var.subnet_cidr}"
  network       = "${google_compute_network.alpha_network.self_link}"
  region        = "${var.gc_region}"
}

data "google_compute_subnetwork" "alpha_subnet" {
  name   = "${var.role}-${var.gc_zone}-${random_id.id.hex}"
  region = "${var.gc_region}"
}

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