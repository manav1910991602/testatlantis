# Introduction
This is a companion repository for Terraform configuration files and provides scripts how to provision and create Aurora DB in AWS using Terraform.


CloudForte Team: CFMigration&Transformation
Release version: 3.0
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.8.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.backup_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan) | resource |
| [aws_backup_selection.backup_selection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_selection) | resource |
| [aws_rds_cluster.rds_aurora](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.rds_aurora](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_cluster_parameter_group.rds_cluster_test_mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Name"></a> [Name](#input\_Name) | A map of tags to assign to the resource | `string` | `"RDS"` | no |
| <a name="input_apply_method"></a> [apply\_method](#input\_apply\_method) | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | n/a | `bool` | `true` | no |
| <a name="input_backup_iam_role_arn"></a> [backup\_iam\_role\_arn](#input\_backup\_iam\_role\_arn) | Iam role for taking backup | `any` | n/a | yes |
| <a name="input_backup_plan"></a> [backup\_plan](#input\_backup\_plan) | name of the backup plan | `any` | n/a | yes |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | retention period for backup | `any` | n/a | yes |
| <a name="input_backup_selection_plan"></a> [backup\_selection\_plan](#input\_backup\_selection\_plan) | backup selection plan name | `any` | n/a | yes |
| <a name="input_cluster_count"></a> [cluster\_count](#input\_cluster\_count) | n/a | `number` | `1` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | The name of the RDS cluster | `string` | `"rdspostgresql"` | no |
| <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name) | Name of the cluster parameter group to associate | `any` | n/a | yes |
| <a name="input_cluster_parameter_name"></a> [cluster\_parameter\_name](#input\_cluster\_parameter\_name) | Name of cluster parameter | `any` | n/a | yes |
| <a name="input_cluster_parameter_value"></a> [cluster\_parameter\_value](#input\_cluster\_parameter\_value) | value of status of cluster parameter | `any` | n/a | yes |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | copy tags to snapshot | `any` | n/a | yes |
| <a name="input_db_family"></a> [db\_family](#input\_db\_family) | Name of the DB family | `any` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database to create when the DB instance is created | `string` | `"postgresql"` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | Name of the DB parameter group family to associate | `any` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Accelerator db subnet group name | `any` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | Specifies cloudwatch logs | `list` | <pre>[<br>  "postgresql",<br>  "upgrade"<br>]</pre> | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to use | `any` | n/a | yes |
| <a name="input_engine_mode"></a> [engine\_mode](#input\_engine\_mode) | mode of the database engine | `string` | `"provisioned"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version to use | `any` | n/a | yes |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | final snapshot name | `any` | n/a | yes |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | n/a | `list` | `[]` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance type of the RDS instance | `any` | n/a | yes |
| <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier) | The name of the RDS instance | `string` | `"rdspostgresql"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | kms key id | `string` | `""` | no |
| <a name="input_log_min_duration_statement"></a> [log\_min\_duration\_statement](#input\_log\_min\_duration\_statement) | n/a | `string` | `"log_min_duration_statement"` | no |
| <a name="input_log_min_duration_value"></a> [log\_min\_duration\_value](#input\_log\_min\_duration\_value) | n/a | `number` | `1` | no |
| <a name="input_log_statement"></a> [log\_statement](#input\_log\_statement) | n/a | `string` | `"log_statement"` | no |
| <a name="input_log_type"></a> [log\_type](#input\_log\_type) | n/a | `string` | `"all"` | no |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | RDS root user password | `any` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | RDS root user username | `any` | n/a | yes |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | n/a | `number` | `7` | no |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | n/a | `string` | `""` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | performance insights is enabled or not | `any` | n/a | yes |
| <a name="input_performance_insights_kms_key_id"></a> [performance\_insights\_kms\_key\_id](#input\_performance\_insights\_kms\_key\_id) | performance insights are encrypted using KMS CMKs | `any` | n/a | yes |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | n/a | `string` | `"23:00-00:00"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | n/a | `string` | `"sun:01:00-sun:02:00"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | IF instance is publicly accessible or not | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"ap-south-1"` | no |
| <a name="input_rule_name"></a> [rule\_name](#input\_rule\_name) | name of the backup rule name | `any` | n/a | yes |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | cron expression ex:cron(0 12 * * ? *) | `any` | n/a | yes |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | secret name from secrets manager | `string` | `"test"` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | whether to skip final snapshot or not | `any` | n/a | yes |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | n/a | `bool` | `true` | no |
| <a name="input_valut_name"></a> [valut\_name](#input\_valut\_name) | name of the valut name to backup | `any` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | Accelerator vpc security group id | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_subnet_group_name"></a> [db\_subnet\_group\_name](#output\_db\_subnet\_group\_name) | n/a |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | n/a |
| <a name="output_rds_cluster_instance_name"></a> [rds\_cluster\_instance\_name](#output\_rds\_cluster\_instance\_name) | n/a |
| <a name="output_rds_cluster_name"></a> [rds\_cluster\_name](#output\_rds\_cluster\_name) | RDS cluster name |


# Prerequisites.
4. Secret should be created to store username and password values in AWS(Secrets Manager). Secret name, Key name of username and password need to passed in tfvars file like below.
secret_id = "<secret name from secrets manager>"
username = "<secret key name of username> "
password = "<secret key name of password>" 
Note : If you would like to use Username/Password which is not stored in  AWS(Secrets Manager). comment the  AWSSecrets Manager block(aws_secretsmanager_secret_version) & change the username and password value in the module "auroramysql" block then use the customized code.

# Note
Aurora RDS has 2 options for encryptions. By default AWS Managed keys are used for encryption. 
Security best practice indicate customer managed key should be used for any RDS service in the cloud.

Default setting is - Customer managed keys for encryption of AWS Aurora MySQL RDS

Terraform code which requires modification for specific Keys for encryption: 

is_custom_kms_key = true (Values ensure customer managed keys are applied for encryption)
is_custom_kms_key = false (AWS applies the default KMS keys for encryption)
copy_tags_to_snapshot = true (Ensure tags are copied to the snapshot) 
multi_az =  true(Ensure RDS is a Multi_AZ )


If new KMS vault is required to be created, ensure the changes are made in the code:
custom_kms_key_required = false.

##Please follow below Steps for executing automation script:

1. Clone the repository  & update the .tfvars file with the user.

2. Navigate to Root directory and run " terraform init " command to load the required modules.

3. Run the command "terraform plan " by providing the required values or use the .tfvars file 
   to check the resources plan.

4. Run the command " terraform apply " by providing the required values or use the .tfvars file 
   to apply the resources to AWS.
   
   note: " terraform apply -var-file="filename.tfvars" is the command to pass the tfvars file.

5. Run the command " terraform destroy " by providing the required values or use the .tfvars file 
   to destroy the resources.  

   note: " terraform destroy -var-file="filename.tfvars" is the command to destroy with tfvars file.

Note: Do not make 'public_network_access_enabled' to 'false', this feature will be available in up coming release.

Note: For more information about AWS database for Aurora, refer to the following link:
https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html


Note: For more information about AWS Key Management service ( KMS ), refer to the follwoing link:
https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html

Note: For More information related to Terraform module, refer to following link:
https://registry.terraform.io/modules/terraform-aws-modules/rds-aurora/aws/latest


## Engineering Support
* [Kamath, Ganapati Bantwal](mailto://Ganapati.Kamath@in.unisys.com) - Product support/queries
* [Amit.Verma2](mailto://Amit.Verma2@unisys.com) - Architecture doubts/queries
* [Debashish.Mishra](mailto://Debashish.Mishra@unisys.com) - Architecture doubts/queries
* [Kamesh.Boggala](mailto://Kamesh.Boggala@unisys.com) - Execution doubts/queries
* [Vivek.Ravindranath](mailto://Vivek.Ravindranath@unisys.com) - Execution doubts/queries
* [Deepak.Narayan@unisys.com](mailto://Deepak.Narayan@unisys.com) - Execution doubts/queries	