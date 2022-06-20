# output "ip_address" {
#   #value = docker_container.nodered_container.ip_address
#   value       = join(":", [docker_container.nodered_container[0].ip_address, docker_container.nodered_container[0].ports[0].external])
#   description = "IP address of the container"

# }
# output "ip_address" {
#   description = "IP address of the second container"
#   value       = join("-", [docker_container.nodered_container[*].ip_address, docker_container.nodered_container[*].ports[0].external])
#   # we can not have * expression here because it expects the list and in this it will tuple


# }

output "docker_container_names" {
  value = docker_container.nodered_container[*].name
}
output "docker_container_ips" {
  value = [for i in docker_container.nodered_container[*]: join(":",[i.ip_address],i.ports[*]["external"])]
  
}