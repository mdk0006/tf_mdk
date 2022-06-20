variable "file" {
  type = map(string)
  default = {
    "name"       = "/home/ubuntu/environment/terraform_prac/file1"
    "motivation" = "You are doing good dont worry!"
  }

}
variable "tuple" {
  type = tuple([string, number, bool])
  #Just like array but can contain muliple data types
  default = ["Danish", 1, true]
}

variable "list" {
  type        = list(number)
  default     = [1, 2]
  description = "#just contains one data type"
}


variable "set" {
  type        = set(string)
  default     = ["Danish", "Khan"]
  description = "Also contains one data type but no repition"
}

variable "object" {
  type = object({

    name           = string
    roll_no        = number
    color          = string
    food           = list(string)
    favourite_food = bool
  })
  default = {
    color          = "black"
    favourite_food = true
    food           = ["chinese rice", "Karahi"]
    name           = "fatima"
    roll_no        = 1
  }

}

variable "filename" {
  type = list(string)
  default = [
    "/home/ubuntu/environment/terraform_prac/cats.txt",
    "/home/ubuntu/environment/terraform_prac/sheeps.txt",
    "/home/ubuntu/environment/terraform_prac/cows.txt",
  "/home/ubuntu/environment/terraform_prac/goats.txt"]

}