resource "aws_s3_bucket" "my_remote_bucket" {
    bucket = "dh-state-bucket"

tags = {
    Name = "dh-state-bucket"
}
}