terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.48.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.16.1"
    }
  }
}

# Retrieve EKS cluster information
provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = "https://5C94573691216AD14D3005F9EDCEFB30.gr7.us-east-1.eks.amazonaws.com"
  cluster_ca_certificate = "-----BEGIN CERTIFICATE-----\nMIIDBTCCAe2gAwIBAgIIOViq9G9EfucwDQYJKoZIhvcNAQELBQAwFTETMBEGA1UE\nAxMKa3ViZXJuZXRlczAeFw0yNDEwMTIxNzM2NDBaFw0zNDEwMTAxNzQxNDBaMBUx\nEzARBgNVBAMTCmt1YmVybmV0ZXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK\nAoIBAQDP81BfQfUXVqt9znY1Wm/9WpaX7Kl+hl2fsC0eApKRMQ6XW/kJouAICYyZ\niPDhmYNxj1X0EbrAT/buHsgJULvw+aHICnr/LuaXd9MnY24W5+i7Ec+Cgj2dV2O7\nKD6xdz77CVdMzyfe2im3R3rMDu4CsmnnqphyDnMrqYqJ5PBPOG17osirolHEUQbE\ns6Qe0nP64FYXRzTl3t8bq/lb0+qHZGZqZvNtaTRWf6Pn9wVmwbzYLET8WNEn+U+V\nsBlhWjYe8wc9X7YSM8g0oxqj+U5w+y1A+Xta3/ls2QQtir9P6mZ103+1/i2XoWuc\n4PlawthSs/QCHEu975JbrMjnutRvAgMBAAGjWTBXMA4GA1UdDwEB/wQEAwICpDAP\nBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTxl0LwDmlSpzgnS9rJvUx2P4MXwzAV\nBgNVHREEDjAMggprdWJlcm5ldGVzMA0GCSqGSIb3DQEBCwUAA4IBAQAVut5UGlrU\n3lQGQOG4OKmAyZquvo3gGXLNwbK72kCU++FJGjEIJPy1M89Yw4uu5lcl7fry+gc7\nYVmSTdnCjW+r9roBt3GcnSCgi9DX1CEfWP7qvg9Fsm1qwxc0hMRBGd6pH9CWkm/I\ng02G97cp8cIqB/mgDMsLwKxWuPKG1HFAUMkD7rGQDVgjNaxAMETPYH59JXQhR1os\nx0UmJHT8YxxgFQ3i9JSXO2rpXL562Kk8CVvSJvfVvI+66EoYCdHJaxOP25oEzHfS\n7+v85fa4QKuBTqwBgs8D5RDecY8LLioGDdjYymaVReTmcZ4uRfNWTMlxTHmrhEjC\ncYYv1UichlS+\n-----END CERTIFICATE-----\n"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      var.cluster_name
    ]
  }
}
