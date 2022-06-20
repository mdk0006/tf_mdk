resource "random_password" "password-gen" {
    # length = var.length
    length = var.length < 8 ? 8: var.length
  
}
output "password" {
    value = nonsensitive(random_password.password-gen.result)
}

variable "length" {
    type = number
    description = "The length of the password"
  
}