# EKS Cluster Creation
module "eks" {
    source          = "terraform-aws-modules/eks/aws"
    version = "20.8.5"

    cluster_name    = var.cluster_name
    cluster_version = var.cluster_version

    cluster_endpoint_public_access           = true
    enable_cluster_creator_admin_permissions = true

 #  cluster_addons = {
  #  aws-ebs-csi-driver = {
 #     service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
 #   }
  #}

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type = var.ami_type

  }

  eks_managed_node_groups = {
    one = {
      name = lower("node-group-${var.cluster_name}")

      instance_types = [var.instance_type]

      min_size     =  var.node_group_min_size
      max_size     =  var.node_group_max_size
      desired_size =  var.node_group_desired_size
    }
  }
}




#data "aws_iam_policy" "ebs_csi_policy" {
#  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
#}

#module "irsa-ebs-csi" {
#  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#  version = "5.39.0"

#  create_role                   = true
#  role_name                     = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
#  provider_url                  = module.eks.oidc_provider
#  role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
#  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
#}
