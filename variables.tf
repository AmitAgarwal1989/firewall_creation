variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "tgw" {
  type        = string
  default     = "tgw-0d48393e955918ec5"
}

variable "route_table_id" {
  type        = string
  default     = "rtb-00453ffad2a22b6be"
}

variable "vpc" {
  type        = string
  default     = "vpc-0f3691077b4551ef9"
}

variable "subnet_id" {
  type        = list(string)
  default     = ["subnet-072b94622cff9440c","subnet-01e951e966d32610a","subnet-0919df9c2d60d300e"]
}

variable "sg_id" {
  type        = string
  default     = "sg-0f760a4c6ec28bee5"
}
