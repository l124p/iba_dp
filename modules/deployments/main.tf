
resource "aws_ecs_task_definition" "my_php_app" {
  family                   = "my-php-app" # Naming our first task
  container_definitions    = <<DEFINITION
  [
    {
      "name": "php",
      "image": "097084951758.dkr.ecr.us-east-1.amazonaws.com/web:latest",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 8080
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
  DEFINITION

}

