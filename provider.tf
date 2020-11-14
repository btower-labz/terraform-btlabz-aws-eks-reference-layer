provider "aws" {
  version = "~> 3.5.0"
  region  = "me-south-1"
  profile = "terraform-infra"
}

data "aws_eks_cluster_auth" "main" {
  name = module.cluster.cluster_name
}

provider "kubernetes" {
  host                   = module.cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.cluster.cluster_k8s_auth)
  token                  = data.aws_eks_cluster_auth.main.token
  load_config_file       = false
}
