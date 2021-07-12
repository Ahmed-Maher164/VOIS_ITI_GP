resource "kubernetes_service" "nodeapp-service" {
  metadata {
    name      = "nodeapp-service"
    namespace = "m-namespace"
  }


  spec {
    selector = {
      app = "nodeApp"
    }
    port {
      port        = 3000
      target_port = 3000
    }

  }

}