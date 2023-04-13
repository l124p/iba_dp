resource "aws_ecr_repository" "l124_dp" {
  name                 = "app"
  image_scanning_configuration {
    scan_on_push = true
  }
}