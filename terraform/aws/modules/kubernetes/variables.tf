variable "arn_node_role" {
  type    = string
  default = "arn:aws:iam::356300141247:role/three-edges-eks-node-role"
}

variable "aws_eks_cluster_auth_token" {
  type = string
}

variable "aws_eks_cluster_auth_endpoint" {
  type = string
}

variable "aws_eks_cluster_auth_certificate" {
  type = string
}

variable "aws_route53_zone_hosted_zone_id" {
  type = string
}

variable "aws_route53_zone_hosted_zone_name" {
  type = string
}