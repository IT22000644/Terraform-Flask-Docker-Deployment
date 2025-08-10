terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_network" "flask_network" {
  name = var.network_name

  provider = docker
}