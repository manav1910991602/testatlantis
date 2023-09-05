output "rds_cluster_name" {
  description = "RDS cluster name"
  value       = aws_rds_cluster.rds_aurora.cluster_identifier
}
output "db_subnet_group_name" {
  value = aws_rds_cluster.rds_aurora.db_subnet_group_name
}
output "kms_key_id" {
  value = aws_rds_cluster.rds_aurora.kms_key_id
}
