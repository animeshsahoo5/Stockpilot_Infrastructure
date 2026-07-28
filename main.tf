module "security" {
  source = "./modules/security"

  vpc_id      = aws_vpc.main.id
  name_prefix = local.name_prefix
  common_tags = local.common_tags
}

module "rds" {
  source = "./modules/rds"

  name_prefix = local.name_prefix
  common_tags = local.common_tags

  private_subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  rds_security_group_id = module.security.rds_security_group_id

  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
  allocated_storage = var.allocated_storage
  engine_version    = var.engine_version
}

module "alb" {

  source = "./modules/alb"

  vpc_id = aws_vpc.main.id

  public_subnet_ids = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  alb_security_group_id = module.security.alb_security_group_id

  name_prefix = local.name_prefix

  common_tags = local.common_tags

}

module "ecr" {

  source = "./modules/ecr"

  name_prefix = local.name_prefix

  common_tags = local.common_tags

}

module "iam" {
  source      = "./modules/iam"
  name_prefix = local.name_prefix
  common_tags = local.common_tags
}

module "cloudwatch" {

  source = "./modules/cloudwatch"

  name_prefix = local.name_prefix

  common_tags = local.common_tags
}
