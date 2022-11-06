
####provider####
provider "aws" {
    region = "us-east-2"
  
}

###Resource
resource "aws_instance" "my_instance" {
    ami = nonsensitive(data.aws_ssm_parameter.ami.value)
    instance_type = "t2.micro"
  
}