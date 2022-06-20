# resource "local_file" "my" {
#   filename = var.file["name"]
#   content  = "Salam Hi!  Here is little saying for you! ${var.file["motivation"]} this is ${var.tuple[2]} sometimes you are not at ${var.list[0]} \n my favourit food is ${var.object.food[0]} \n my favourite color is ${var.object.color}"
# }


# resource "local_file" "files" {
#   #count = 3
#   #filename = "/home/ubuntu/environment/terraform_prac/file1"
#   filename = var.filename[count.index] #This will still create the 3 files because it is counting the count index
#   #but what if we want count will automatically get the count from the filename variable lengt
#   count = length(var.filename)
#   content  = data.local_file.dogs.content

# }

data "local_file" "dogs" {
  filename = "/home/ubuntu/environment/terraform_prac/dogs.txt"
}

resource "local_file" "files" {
  #count = 3
  #filename = "/home/ubuntu/environment/terraform_prac/file1"
filename = each.value
for_each = toset(var.filename) # because for_each only works with maps or sets
content = data.local_file.dogs.content
}
