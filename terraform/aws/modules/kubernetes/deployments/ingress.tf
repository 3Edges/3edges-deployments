resource "kubernetes_ingress_v1" "three_edges_ingress" {
  metadata {
    name      = "three-edges-ingress"
    namespace = "3edges"

    annotations = {
      "cert-manager.io/cluster-issuer" = "cert-manager-cluster-issuer"
    }
  }

  spec {
    ingress_class_name = "nginx"

    tls {
      hosts       = [var.hosted_zone, "*.${var.hosted_zone}"]
      secret_name = "letsencrypt-wildcard-secret"
    }

    rule {
      host = var.hosted_zone
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "frontend-srv"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = "cluster.${var.hosted_zone}"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-srv"
              port {
                number = 3001
              }
            }
          }
        }
      }
    }
  }

  depends_on = [var.cert_manager, var.ingress_nginx, var.kubernetes_namespace_namespace]
}
