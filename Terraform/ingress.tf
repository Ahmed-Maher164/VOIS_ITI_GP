resource "kubernetes_ingress" "my_ingress" {
  metadata {
    name = "my-ingress"

    annotations = {
      "kubernetes.io/ingress.class"                = "nginx"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"

    }


    namespace = "m-namespace"
  }

  spec {

    backend {
      service_name = "jenkins-service"
      service_port = 8080
    }

    rule {

      host = "eks-dev-cluster-1693003783.us-west-2.elb.amazonaws.com"

      http {
        path {
          path = "/jenkinsapp"
          backend {
            service_name = "m-jenkins-service"
            service_port = 4040
          }
        }
        path {
          path = "/nodeapp"
          backend {
            service_name = "nodeapp-service"
            service_port = 3000
         
         }
        }

      }


    }


  }


}
