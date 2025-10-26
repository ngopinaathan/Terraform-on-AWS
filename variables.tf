# variable to define region
variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "Please enter region here"
}

# variable to define VPC name
# variable "vpcname" {
#  type        = string
#  description = "Please provide VPC name"
#}

# variable to define list of strings
variable "vpc_cidrs" {
  type        = list(string)
  description = "This is VPC CIDR ranges"
  default     = ["10.0.0.0/16", "192.168.0.0/16"]
}

# variable to define list
variable "subnet_Cidrblock" {
  type        = list(string)
  description = "Enter Subnet CIDR block here"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

# variable to define object or list of objects
variable "instance_details" {
  description = "This is variable to type object"
  type = object({
    name = string
    size = string
  })

  default = {
    name = "dev-ec2-01"
    size = "t2.micro"
  }
}

# variable to define map of objects
variable "map_of_objects" {
  description = "This is variable to type map of objects"
  type = map(object({
    name = string
    size = string
  }))

  default = {
    Dev = {
      name = "Dev-ec2-01"
      size = "t2.micro"
    }
    Prod = {
      name = "Prod-ec2-01"
      size = "t2.large"
    }
  }
}

# variable to define dynamic blocks
variable "ingressrules" {
  type = list(object({
    port        = string
    description = string
  }))

  default = [
    {
      port        = 443
      description = "port 443"
    },
    {
      port        = 80
      description = "port 80"
    }
  ]
}
# End of dynamic blocks

variable environment {
  type        = string
  description = "The environment for the infrastructure"
  default     = "dev"
}

# End of variables.tf