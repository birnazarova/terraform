resource "aws_launch_configuration" "launch_configuration" {
  name_prefix = "launch_configuration-"

  image_id = "ami-087c17d1fe0178315" 
  instance_type = "t2.micro"
  # key_name = "tests"

  security_groups = [ aws_security_group.sg1.id ]
  associate_public_ip_address = true
  user_data = file("data.sh")

  lifecycle {
    create_before_destroy = true #I am using create_before_destroy here to create new instances from a new launch configuration before destroying the old ones.
  }
}