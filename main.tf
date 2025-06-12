module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block            = var.vpc_cidr_block
  public_subnet_1_cidr      = var.public_subnet_1_cidr
  public_subnet_2_cidr      = var.public_subnet_2_cidr
  private_subnet_1_cidr     = var.private_subnet_1_cidr
  private_subnet_2_cidr     = var.private_subnet_2_cidr
}

module "ecr" {
  source = "./modules/ecr"
  repo_name_1               = var.repo_name_1
}

module "security_groups" {
  source = "./modules/security_groups"
  alb_sg_name               = var.alb_sg_name
  app_sg_name               = var.app_sg_name
  vpc_id = module.vpc.vpc_id
}

#module "iam" {
#  source = "./modules/iam"
#  eks_cluster_role_name = var.eks_cluster_role_name
#  eks_worker_node_role_name = var.eks_worker_node_role_name
#}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  flask_app_tg              = var.flasktg
  alb_name                  = var.alb_name
  alb_sg                    = [module.security_groups.alb_sg]
  subnet_ids                = module.vpc.public_subnets
}

module "eks" {
  source                    = "./modules/eks"
  eks_cluster_role_name = var.eks_cluster_role_name
  eks_worker_node_role_name = var.eks_worker_node_role_name
  eks_cluster_name          = var.eks_cluster_name
  node_group_name           = var.node_group_name
# role_arn                  = module.eks.cluster_role_arn
# public_subnets            = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
# private_subnets           = [module.vpc.private_subnet_1, module.vpc.private_subnet_2]
  subnet_ids                = module.vpc.public_subnets
#  subnet_ids                = module.vpc.private_subnets
}