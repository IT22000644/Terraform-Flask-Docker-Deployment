terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "mysql" {
  name = "mysql:8.0"
}

resource "docker_container" "mysql" {
  name  = "mysql-container"
  image = docker_image.mysql.name

  networks_advanced {
    name = var.network_name
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}",
    "MYSQL_USER=${var.mysql_user}",
    "MYSQL_PASSWORD=${var.mysql_password}"
  ]

  ports {
    internal = 3306
    external = 3306
  }
}
