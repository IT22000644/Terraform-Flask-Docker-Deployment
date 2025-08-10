terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "flask_app" {
  name = "flask-app"
  build {
    context = "${path.module}/../../docker"
  }
}

resource "docker_container" "flask" {
  name  = "flask-app"
  image = docker_image.flask_app.name

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 5000
    external = 5000
  }

  volumes {
    host_path      = abspath("${path.module}/../../docker/config/db_config.py")
    container_path = "/app/config/db_config.py"
  }
}
