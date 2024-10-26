# Required Providers
terraform {

  # cloud {
  #   workspaces {
  #     name = "learn-terraform-eks"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.4"
    }
  }

  required_version = "~> 1.3"
}

# AWS Provider Configuration
provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

/*
Retrieve information about an EKS Cluster.
*/
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
  depends_on = [ module.eks ]
}

/*
Get an authentication token to communicate with an EKS cluster.
*/
data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
    depends_on = [data.aws_eks_cluster.cluster]
}

# Kubernetes Provider
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# Helm Provider
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}
