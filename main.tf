
####provider####
provider "aws" {
    region = "us-east-2"
  
}

###Resource
resource "aws_instance" "my_instance" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]


    user_data = <<-EOF
    #!/bin/bash
    echo ""Hello,world" > index.html
    nohup busybox httpd -f -p 8080 &
    EOF

    tags = {
      "Name" = "terraform-example"
    }
  
}
resource "aws_security_group" "instance" {
    name = "terraform-example-instance"

    ingress =  {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 8080
      protocol = "tcp"
      to_port = 8080
    } 

  
}

########date
#data "aws_ssm_parameter" "ami" {
#  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
#}