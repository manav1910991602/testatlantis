provider "aws" {
  region = var.region # Replace with your desired region
}
resource "aws_rds_cluster" "rds_aurora" {
  backup_retention_period             = var.backup_retention_period
  cluster_identifier                  = var.cluster_identifier
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  database_name                       = var.db_name
  db_cluster_parameter_group_name     = aws_rds_cluster_parameter_group.rds_cluster_test_mysql.name
  db_subnet_group_name                = var.db_subnet_group_name
  deletion_protection                 = var.deletion_protection
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  engine                              = var.engine
  engine_mode                         = var.engine_mode
  engine_version                      = var.engine_version
  final_snapshot_identifier           = var.final_snapshot_identifier
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  iam_roles                           = var.iam_roles
  kms_key_id                          = var.kms_key_id
  master_username                     = var.master_password
  master_password                     = var.master_password
  preferred_backup_window             = var.preferred_backup_window
  preferred_maintenance_window        = var.preferred_maintenance_window
  skip_final_snapshot                 = var.skip_final_snapshot
  storage_encrypted                   = var.storage_encrypted
  vpc_security_group_ids              = var.vpc_security_group_ids

  tags = {
    Name = var.Name
  }
}

resource "aws_rds_cluster_instance" "rds_aurora" {

  cluster_identifier              = aws_rds_cluster.rds_aurora.id
  instance_class                  = var.instance_class
  count                           = var.cluster_count
  identifier                      = var.instance_identifier
  engine                          = aws_rds_cluster.rds_aurora.engine
  engine_version                  = aws_rds_cluster.rds_aurora.engine_version
  auto_minor_version_upgrade      = var.auto_minor_version_upgrade
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  db_parameter_group_name         = var.db_parameter_group_name
  db_subnet_group_name            = var.db_subnet_group_name
  monitoring_interval             = var.monitoring_interval
  monitoring_role_arn             = var.monitoring_role_arn
  performance_insights_enabled    = var.performance_insights_enabled
  performance_insights_kms_key_id = var.performance_insights_kms_key_id
  preferred_maintenance_window    = var.preferred_maintenance_window
  publicly_accessible             = var.publicly_accessible

  tags = {
    Name = var.Name
  }
}

resource "aws_rds_cluster_parameter_group" "rds_cluster_test_mysql" {
  name   = var.cluster_parameter_group_name
  family = var.db_family

  parameter {
    name         = var.cluster_parameter_name
    value        = var.cluster_parameter_value
    apply_method = var.apply_method
  }
}

resource "aws_backup_plan" "backup_plan" {
  name = var.backup_plan

  rule {
    rule_name         = var.rule_name
    target_vault_name = var.valut_name
    schedule          = var.schedule
  }
}
resource "aws_backup_selection" "backup_selection" {
  iam_role_arn = var.backup_iam_role_arn
  name         = var.backup_selection_plan
  plan_id      = aws_backup_plan.backup_plan.id

  resources = [
    aws_rds_cluster.rds_aurora.arn
  ]
}