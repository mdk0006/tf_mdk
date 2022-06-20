module "us_payroll" {
  source     = "../modules/payroll-ap"
  app_region = "us-east-2" # Variables defined in the child module
  #ami        = "ami-24e14011977avm"      # Variables defined in the child module
  bucket = "danish-put-it-from-root2" # If you will not specify the value it will get the value from the default one
}