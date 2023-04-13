#------------ APP --------------------
resource "kubernetes_deployment" "php-web" {
  metadata {
    name = "php-web"
    labels = {
      app = "php-web"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "php-web"
      }
    }

    template {
      metadata {
        labels = {
          app = "php-web"
        }
      }

      spec {
        container {
          image = "097084951758.dkr.ecr.us-east-1.amazonaws.com/web:latest"
          name  = "php-web"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}


#--------------LoadBalancer
resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      app = "nginx"
    }
  }

  spec {
    selector = {
      app = "php-web"
    }

    port {
      name       = "http"
      port       = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
