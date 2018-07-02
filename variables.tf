variable "gc_region" {
  default = "us-east1"
}

variable "gc_zone" {
  default = "us-east1-b"
}

variable "google_project" {
  type        = "string"
  description = "Name of Google Project"
}

variable "role" {}

variable "subnet_cidr" {
  default = "10.0.0.0/16"
}

variable "cluster_size" {}
