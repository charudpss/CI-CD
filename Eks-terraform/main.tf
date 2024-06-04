# Creating VPC
module "vpc" {
  source       = "./modules/vpc"
  cluster_name = var.cluster_name
  env          = var.env
  type         = var.type
}

# Creating security group
module "security_groups" {
  source       = "./modules/SG"
  vpc_id       = module.vpc.vpc_id
  cluster_name = var.cluster_name
  ssh_access   = var.ssh_access
  http_access  = var.http_access
  env          = var.env
  type         = var.type
}


# Creating IAM resources
module "iam" {
  source = "./modules/IAM"
}

# Creating EKS Cluster
module "eks" {
  source                = "./modules/EKS"
  master_arn            = module.iam.master_arn
  worker_arn            = module.iam.worker_arn
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  env                   = var.env
  type                  = var.type
  eks_security_group_id = module.security_groups.eks_security_group_id
  instance_size         = var.instance_size
  cluster_name          = var.cluster_name
  worker_node_count     = var.instance_count
}
