variable "region" {
  description = "Region"
  type        = string
  default     = ""
}
variable "secret_id" {
  default     = "test"
  description = "secret name from secrets manager"
}
variable "cluster_identifier" {
  default     = "rdspostgresql"
  description = "The name of the RDS cluster"
}
variable "engine" {
  description = "The database engine to use"
}
variable "engine_version" {
  description = "The engine version to use"
}
variable "engine_mode" {
  default     = "provisioned"
  description = "mode of the database engine"
}
variable "instance_identifier" {
  default     = "rdspostgresql"
  description = "The name of the RDS instance"
}
variable "instance_class" {
  description = "The instance type of the RDS instance"
}
variable "db_name" {
  default     = "postgresql"
  description = "The name of the database to create when the DB instance is created"
}
variable "master_username" {
  description = "RDS root user username"
}
variable "master_password" {
  description = "RDS root user password"
  sensitive   = true
}
variable "cluster_parameter_group_name" {
  description = "Name of the cluster parameter group to associate"
}
variable "db_parameter_group_name" {
  description = "Name of the DB parameter group family to associate"
}
variable "db_family" {
  description = "Name of the DB family"
}
variable "cluster_parameter_name" {
  description = "Name of cluster parameter"
}
variable "cluster_parameter_value" {
  description = "value of status of cluster parameter"
}
variable "publicly_accessible" {
  default     = false
  description = "IF instance is publicly accessible or not"
}
variable "apply_method" {
  default     = false
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
}
variable "enabled_cloudwatch_logs_exports" {
  default     = ["postgresql", "upgrade"]
  description = "Specifies cloudwatch logs"
}
variable "db_subnet_group_name" {
  description = "Accelerator db subnet group name"
}
variable "vpc_security_group_ids" {
  description = "Accelerator vpc security group id"
}
variable "iam_database_authentication_enabled" {
  type    = bool
  default = true
}
variable "iam_roles" {
  default = []
}
variable "kms_key_id" {
  description = "kms key id"
  default     = ""
}
variable "backup_retention_period" {
  description = "retention period for backup"
}
variable "copy_tags_to_snapshot" {
  description = "copy tags to snapshot"
}
variable "deletion_protection" {
  type    = bool
  default = true
}
variable "final_snapshot_identifier" {
  description = "final snapshot name"
}
variable "skip_final_snapshot" {
  description = "whether to skip final snapshot or not"
}
variable "storage_encrypted" {
  type    = bool
  default = true
}
variable "Name" {
  default     = "RDS"
  description = "A map of tags to assign to the resource"
}
variable "auto_minor_version_upgrade" {
  type    = bool
  default = true
}
variable "monitoring_interval" {
  default = 7
}
variable "performance_insights_enabled" {
  description = "performance insights is enabled or not"
}
variable "performance_insights_kms_key_id" {
  description = "performance insights are encrypted using KMS CMKs"
}
variable "backup_plan" {
  description = "name of the backup plan"
}

variable "rule_name" {
  description = "name of the backup rule name"
}
variable "valut_name" {
  description = "name of the valut name to backup"
}
variable "schedule" {
  description = "cron expression ex:cron(0 12 * * ? *)"
}
variable "backup_iam_role_arn" {
  description = "Iam role for taking backup"
}
variable "backup_selection_plan" {
  description = "backup selection plan name"
}
variable "preferred_backup_window" {
  default = "23:00-00:00"
}
variable "preferred_maintenance_window" {
  default = "sun:01:00-sun:02:00"
}
variable "cluster_count" {
  default = 1
}
variable "monitoring_role_arn" {
  default = ""
}
variable "log_statement" {
  default = "log_statement"
}
variable "log_type" {
  default = "all"
}
variable "log_min_duration_statement" {
  default = "log_min_duration_statement"
}
variable "log_min_duration_value" {
  default = 1
}