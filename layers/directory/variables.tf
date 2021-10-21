variable "simple_ad_name" {
  description = "Name of the Simple AD"
  type        = string
  default     = "corp.mycompany.com"
}


variable "vpc_id" {
  description = "The VPC to put in"
  type = string
}

variable "vpc_public_subnets" {
  type = list(string)
}