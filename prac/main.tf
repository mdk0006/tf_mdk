resource "local_file" "my" {
    count = 3
    filename= "cat-${count.index}"
    content = "danish"
}