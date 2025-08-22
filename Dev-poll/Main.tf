module "ecs_cluster" {
  source       = "./modules/ecs-cluster"
  cluster_name = "poll_cluster"
}

module "load_balancer" {
  source = "./modules/load-balancer"
}

module "ec2_launch" {
  source         = "./modules/ec2-launch"
  subnet_ids     = module.load_balancer.subnet_ids
  security_group = module.load_balancer.security_group
}

module "ecs-service" {
    #launch_type = "EC2"
  source         = "./modules/ecs-service"
  cluster_name   = module.ecs_cluster.cluster_name
  alb_target_arn = module.load_balancer.target_group_arn
  subnet_ids     = module.load_balancer.subnet_ids
  security_group = module.load_balancer.security_group
  #app_image      = var.app_image
}

module "ecs-service" {
  source     = "./modules/ecs"
  app_image  = var.app_image
}
