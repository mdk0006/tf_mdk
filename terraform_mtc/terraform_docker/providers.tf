terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = { # basically this is the alias which is telling any resource calling this name will use this provider
      source  = "kreuzwerker/docker"
      version = "~>2.15"
    }
  }
}
provider "docker" {
  # It is empty because we are using this on local machine

}