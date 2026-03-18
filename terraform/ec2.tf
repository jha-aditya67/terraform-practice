# AWS Key Pair

resource "aws_key_pair" "terra_automate_key" {
    key_name = "terra__automate_key"
    public_key = file("terra-practice-key.pub")
    
    tags = {
        Name = "terra_automate_key"
    }
}

# VPC and Security group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_terra_sg" {
    name = "terra_automate_sg"
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id = aws_default_vpc.default.id

    tags = {
        Name = "terra_automate_sg"
    }

    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "SSH open"
    }

    ingress {
        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "HTTPS open"
    }

    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "HTTP open"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "All traffic allowed"
    }
}

# EC2 instance

resource "aws_instance" "terra-automate-instance" {
    ami = "ami-0ec10929233384c7f"
    instance_type = "t3.micro"
    key_name = aws_key_pair.terra_automate_key.key_name
    security_groups = [aws_security_group.my_terra_sg.name]
    root_block_device {
      volume_size = 8
      volume_type = "gp3"
    }

    tags = {
        Name = "terra-automate-instance"
    }
    
}