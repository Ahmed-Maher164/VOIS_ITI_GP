resource "kubernetes_deployment" "jenkins" {


  metadata {
    name = "jenkins-deployment"
    labels = {
      test = "jenkinsServer"
    }
    namespace = "m-namespace"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "jenkinsApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "jenkinsApp"
        }
      }

      spec {
        container {
          image = "maher164/jenkins-cicd"
          name  = "jenkins-container"
          port {
            container_port = 8080
          }
          volume_mount {
            mount_path = "/var/run/docker.sock"
            name       = "docker-sock"

          }
          security_context {
            run_as_user = 0
          }



        }

        volume {
          name = "docker-sock"
          host_path {
            path = "/var/run/docker.sock"
          }

        }

      }




    }
  }
}