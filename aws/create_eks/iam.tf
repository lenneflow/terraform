# IAM Role for EKS Ingress Controller
resource "aws_iam_role" "eks_ingress_controller" {
  name = "eks-ingress-controller"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}
