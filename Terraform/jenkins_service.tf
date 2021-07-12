resource "kubernetes_service" "jenkins-service" {
  metadata {
    name      = "m-jenkins-service"
    namespace = "m-namespace"
  }


  spec {
    selector = {
      test = "jenkinsApp"
    }
    port {
      port        = 4040
      target_port = 8080
    }


  }

}