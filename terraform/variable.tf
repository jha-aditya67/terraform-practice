variable "key_pair" {
    default = "terra_automate_key"
    type = string
}

variable "security_group" {
    default = "terra_automate_sg"
    type = string
}

variable "instance_type" {
    default = {
        terra-automate-micro = "t3.micro"
        terra-automate-small = "t3.small"
    }
    type = map(string)
}

variable "ami_id" {
    default = "ami-0ec10929233384c7f"
    type = string
}

variable "root_storage_block" {
    default = 8
    type = number
}
