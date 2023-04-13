resource "aws_ecr_repository" "l124_dp" {
  name                 = "web"
  # image_scanning_configuration {
  #   scan_on_push = true
  # }
}