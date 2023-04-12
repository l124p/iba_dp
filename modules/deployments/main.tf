# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: my-web-php

# spec:
#   replicas: 2
#   selector:
#     matchLabels:
#       project: php-app
#   template:
#     metadata:
#       labels:
#         project: php-app # Service will look for those PODS Labels
#     spec:
#       containers:
#         - name: php-web
#           image: 097084951758.dkr.ecr.us-east-1.amazonaws.com/web:latest
#           ports:
#             - containerPort: 80



# resource "aws_ecs_task_definition" "my_php_app" {
#   family                   = "my-php-app" # Naming our first task
#   container_definitions    = <<DEFINITION
#   [
#     {
#       "name": "php",
#       "image": "097084951758.dkr.ecr.us-east-1.amazonaws.com/web:latest",
#       "essential": true,
#       "portMappings": [
#         {
#           "containerPort": 80,
#           "hostPort": 8080
#         }
#       ],
#       "memory": 512,
#       "cpu": 256
#     }
#   ]
# #   DEFINITION
# #   requires_compatibilities = ["FARGATE"] # Stating that we are using ECS Fargate
# #   network_mode             = "awsvpc"    # Using awsvpc as our network mode as this is required for Fargate
# #   memory                   = 512         # Specifying the memory our container requires
# #   cpu                      = 256         # Specifying the CPU our container requires
# #   execution_role_arn       = "${aws_iam_role.ecsTaskExecutionRole.arn}"
# }

# resource "kubernetes_namespace" "test" {
#    metadata {
#      name = "nginx"
#    }
# }


resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "example"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

# resource “kubernetes_service” “test” {
#   metadata {
#     name      = “nginx”
#     namespace = kubernetes_namespace.test.metadata.0.name
#   }
#   spec {
#     selector = {
#       app = kubernetes_deployment.test.spec.0.template.0.metadata.0.labels.app
#     }
#     type = “LoadBalancer”
#     port {
#       port        = 80
#       target_port = 80
#     }
#   }
# }