resource "aws_instance" "ittalent_ec2" {
  ami = "ami-0e83be366243f524a"
  instance_type = "t2.micro"
  key_name =   "junior-ittalent"

  vpc_security_group_ids = ["sg-04a620fce0f63ec88"]

#Executar comandos na instancia
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

#Copiar arquivo para dentro da instancia, vale lembrar que o arquivo precisa está na mesma pasta do arquivo .tf
provisioner "file" { 
    source = "script.sh"
    destination = "/tmp/script.sh"
}

#Executar comandos automaticamente dentro da instancia
provisioner "remote-exec" {
  inline = [ 
    "sudo chmod +x /tmp/script.sh",
    "sudo bash /tmp/script.sh",
    "sudo systemctl restart nginx",
   ]
}
#configurações de conexão 
connection {
  type = "ssh"
  user = "ubuntu"
  private_key = file(key.pem)
  host = self.public_ip
}
}

