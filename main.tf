resource "random_id" "subnet_id" {
  byte_length = 8
}

resource "random_id" "id" {
  byte_length = 8
}

resource "google_compute_network" "network" {
  name = "${var.role}-${var.gc_zone}-${random_id.id.hex}"

  # auto_create_subnetworks = "true"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.role}-${var.gc_zone}-${random_id.subnet_id.hex}"
  ip_cidr_range = "${var.subnet_cidr}"
  network       = "${google_compute_network.network.self_link}"
  region        = "${var.gc_region}"
}
