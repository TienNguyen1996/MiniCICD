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
