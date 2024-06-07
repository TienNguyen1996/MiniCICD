terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"

    }
  }
}

provider "docker" {}

resource "docker_image" "java" {
  name         = "java"
  build{
    context = ".."
  }
  keep_locally = true
}

# Start a container
resource "docker_container" "tomcat" {
  name  = "tomcat"
  image = docker_image.java.image_id
  ports {
    internal = 8080
    ip = "0.0.0.0"
    external = 8000
  }
}
