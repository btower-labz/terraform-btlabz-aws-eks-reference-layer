module "vpc" {
  source = "git::https://github.com/btower-labz/terraform-aws-btlabz-pub2x-pri2x-dbs2x.git?ref=v0.1.2"
  #source  = "btower-labz/btlabz-pub2x-pri2x-dbs2x/aws"
  #source = "../../modules/terraform-aws-btlabz-pub2x-pri2x-dbs2x"
  #version = "0.1.1"

  tags = var.tags

  private_subnet_tags = map(
    format("kubernetes.io/cluster/%s", var.cluster_name), "",
    "kubernetes.io/role/internal-elb", ""
  )

  public_subnet_tags = map(
    format("kubernetes.io/cluster/%s", var.cluster_name), "shared",
    "kubernetes.io/role/elb",""
  )
}
