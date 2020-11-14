module "cluster" {
  #source = "git::https://github.com/btower-labz/terraform-aws-btlabz-arch-ref-ec2-balancer-module.git?ref=master"
  source = "../../modules/terraform-aws-btlabz-eks-cluster-module"

  cluster_name = var.cluster_name
  #  name = "ba"
  subnets = [
    module.vpc.public_a,
    module.vpc.public_b
  ]
  #  zone_id = module.subzone.zone_id
  #  alias_list = [
  #    "foo",
  #    "bar",
  #    "dashboard"
  #  ]

  k8s_iam_auth_profile = "terraform-infra"

  aws_auth_node_role_arns = [
    module.workers.worker_node_role_arn
  ]

  tags = var.tags
}

module "workers" {
  source = "../../modules/terraform-aws-btlabz-eks-workers-module"
  eks_cluster = module.cluster.cluster_name
  group_name = "foo"
  
  subnets = [
    module.vpc.private_a,
    module.vpc.private_b
  ]
  tags = var.tags
}
