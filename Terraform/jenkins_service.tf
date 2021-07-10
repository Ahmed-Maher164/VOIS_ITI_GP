resource "kubernetes_service" "jenkins-service" {
  metadata {
    name      = "jenkins-service"
    namespace = "m-namespace"
  }


  spec {
    selector = {
      test = "jenkinsApp"
    }
    port {
      port        = 8080
      target_port = 8080
    }


  }

}