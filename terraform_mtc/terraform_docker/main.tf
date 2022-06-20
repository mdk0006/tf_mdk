resource "docker_image" "nodered_image" {
  name = "nodered/node-red"

}
resource "docker_container" "nodered_container" {
  count = 1
  name  = join("_", ["nodered-container", random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    # this is the map thats why
    internal = 1880
    #external = 1880
  }
}

# }
resource "random_string" "random" {
  # Creating two strings using the same block
  count   = 1
  length  = 4
  special = false
  upper   = false
}
