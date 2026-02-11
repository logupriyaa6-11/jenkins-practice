module "security_group" {
  source = "./modules/security-groups"
  vpc_id = var.vpc_id
}

module "ec2_instance" {
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.security_group.security_group_id
}