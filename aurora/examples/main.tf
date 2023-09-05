# Below two methods of authentication are provided. One is to use roles to get authenticated and the other is to use keys. Once a choice is 
# made about which authentication to use, Please comment on the other one. 
provider "aws" {
  region = var.region
  assume_role {
    role_arn     = var.role_arn
    session_name = var.session_name
  }
}
/*
#If you want to authenticate using keys, Please use below mentioned.
provider "aws" {
  region     = var.region
  access_key = ""
  secret_key = ""
}
*/
data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = var.secret_id
}
data "aws_kms_key" "kms_alias_arn" {
  count = var.is_custom_kms_key ? var.not_create : var.create
  key_id = var.kms_key_id
}
resource "aws_kms_key" "aurora_rds_keys" {
  count = var.is_custom_kms_key ? var.create : var.not_create
  description              = var.Kms_description
  deletion_window_in_days  = var.Kms_deletion_windows
  key_usage                = var.kms_key_type
  customer_master_key_spec = var.kms_customer_key_spec
  multi_region             = var.multi_az
  enable_key_rotation      = var.enable_key_rotation
}
module "auroramysql" {
  source                              = "../modules"
  backup_retention_period             = var.backup_retention_period
  cluster_identifier                  = var.cluster_identifier
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  db_name                             = var.db_name
  db_subnet_group_name                = var.custom_db_subnet_group_name
  deletion_protection                 = var.deletion_protection
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  engine                              = var.engine
  engine_mode                         = var.engine_mode
  engine_version                      = var.engine_version
  final_snapshot_identifier           = var.final_snapshot_identifier
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  iam_roles                           = var.iam_roles
  kms_key_id                          = var.storage_encrypted ? (var.is_custom_kms_key ? var.kms_key_id : aws_kms_key.aurora_rds_keys[0].arn):""
  master_username                     = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)[var.postgresql_username]
  master_password                     = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)[var.postgresql_password]
  preferred_backup_window             = var.preferred_backup_window
  preferred_maintenance_window        = var.preferred_maintenance_window
  skip_final_snapshot                 = var.skip_final_snapshot
  storage_encrypted                   = var.storage_encrypted
  vpc_security_group_ids              = var.custom_vpc_security_group_ids
  Name                                = var.Name
  instance_class                      = var.instance_class
  cluster_count                       = var.cluster_count
  instance_identifier                 = var.instance_identifier
  auto_minor_version_upgrade          = var.auto_minor_version_upgrade
  db_parameter_group_name             = var.db_parameter_group_name
  monitoring_interval                 = var.monitoring_interval
  monitoring_role_arn                 = var.monitoring_role_arn
  performance_insights_enabled        = var.performance_insights_enabled
  performance_insights_kms_key_id     = var.is_custom_kms_key ? var.kms_key_id : aws_kms_key.aurora_rds_keys[0].arn
  publicly_accessible                 = var.publicly_accessible
  cluster_parameter_group_name        = var.cluster_parameter_group_name
  db_family                           = var.db_family
  cluster_parameter_name              = var.cluster_parameter_name
  cluster_parameter_value             = var.cluster_parameter_value
  apply_method                        = var.apply_method
  rule_name                           = var.rule_name
  valut_name                          = var.valut_name
  schedule                            = var.schedule
  backup_plan                         = var.backup_plan
  backup_iam_role_arn                 = var.backup_iam_role_arn
  backup_selection_plan               = var.backup_selection_plan

}
