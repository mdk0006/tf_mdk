variable "ecr_name" {
  type        = set(string)
  default     = ["menu", "user", "ca"]
  description = "Giving the names for repo in [ ] format"
}
