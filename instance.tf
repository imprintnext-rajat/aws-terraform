resource "aws_instance" "web" {
  #count                  = 2
  ami                    = "ami-03d3eec31be6ef6f9"
  instance_type          = "t2.small"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.mysg.id]
  subnet_id              = var.subnet_id

  user_data = file("script.sh") # directory path of userdata =/var/lib/cloud/instances/
 


  tags = {
    # Name = "webapp -${count.index + 1}"
    Name = "webapp"
  }
}

resource "aws_eip" "IP" {
  vpc = true

  public_ipv4_pool = "amazon"
}
 /* //this is use for attach elastic_IPaddress
  resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = var.elasticIP_allocation_ID
} */
