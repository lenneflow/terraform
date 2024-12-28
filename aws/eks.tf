# EKS Cluster Creation
module "eks" {
    source          = "terraform-aws-modules/eks/aws"
    version = "20.8.5"

    cluster_name    = var.cluster_name
    cluster_version = var.cluster_version

    cluster_endpoint_public_access           = true
    enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type = var.ami_type

  }

  eks_managed_node_groups = {
    one = {
      name = lower("ng-${var.cluster_name}")

      instance_types = [var.instance_type]

      min_size     =  var.node_group_min_size
      max_size     =  var.node_group_max_size
      desired_size =  var.node_group_desired_size
    }
  }
}

