provider "aws" {
  region = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "ittalent_ec2" {
  ami = "ami-0e83be366243f524a"
  instance_type = "t2.micro"
  key_name =   "junior-ittalent"

  vpc_security_group_ids = ["sg-04a620fce0f63ec88"]

  user_data = <<-EOF
          #!/bin/bash
          apt-get update -y
          apt-get install -y nginx
          sytemctl enable nginx
          systemctl start nginx
          EOF
  
  tags = {
    Name= "Junior-Ittalent"
  }

}

