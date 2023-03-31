## Step 1 ###
resource "aws_instance" "my_instance" {
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t2.micro"
  availability_zone = "us-east-1e"
  cpu_core_count = 1
  cpu_threads_per_core = 1
  disable_api_stop = false

  tags = {
    Name = "manually-created-instance-1"
  }
}

### Step 2 ###
# resource "aws_instance" "instance" {
#   ami           = "ami-02f3f602d23f1659d"
#   instance_type = "t3.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }

### Step 3 ###
# resource "aws_instance" "instance" {
#   ami           = "ami-02f3f602d23f1659d"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }

### Step 4 ###
# resource "aws_instance" "instance" {
#   ami           = "ami-02f3f602d23f1659d"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "terraform-import"
#   }
# }