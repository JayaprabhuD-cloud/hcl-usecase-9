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

module "iam" {
  source = "./modules/iam"
  eks_cluster_role_name = var.eks_cluster_role_name
  eks_worker_node_role_name = var.eks_worker_node_role_name
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  flask_app_tg              = var.flask_app_tg
  alb_name                  = var.alb_name
  alb_sg                    = [module.security_groups.alb_sg]
  public_subnets = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
}



module "ecs" {
  source                    = "./modules/ecs"
  cluster_name              = var.cluster_name
  private_subnets           = [module.vpc.private_subnet_1, module.vpc.private_subnet_2]
  app_sg_name               = [module.security_groups.app_sg]
  task_execution_role_arn   = module.iam.ecs_task_execution_role_arn
  task_role_arn             = module.iam.ecs_task_role_arn
  ecr_patient_repo_url      = module.ecr.patient_repo_url
  ecr_appointment_repo_url  = module.ecr.appointment_repo_url
  target_group_arns         = module.alb.target_group_arns
  container_cpu             = var.container_cpu
  container_memory          = var.container_memory
  app_port                  = var.app_port
  desired_capacity          = var.desired_capacity
  appoinment_log_group_name = var.appoinment_log_group_name
  appointment_service_task  = var.appointment_service_task
  patient_service_name      = var.patient_service_name
  appointment_service_name  = var.appointment_service_name
  patient_service_task_name = var.patient_service_task_name
  patient_log_group_name    = var.patient_log_group_name
}