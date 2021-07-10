resource "kubernetes_namespace" "my-namespace" {
  metadata {

    labels = {
      mylabel = "m-namespace"
    }

    name = "m-namespace"
  }
}
