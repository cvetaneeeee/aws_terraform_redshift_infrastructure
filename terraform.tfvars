##########################
# Application Definition # 
##########################
app_name        = "<app name>" # Do NOT enter any spaces
app_environment = "<env name>" # Dev, Test, Staging, Prod, etc

#########################
# Network Configuration #
#########################
redshift_serverless_vpc_cidr      = "<vpc cidr>"
redshift_serverless_subnet_1_cidr = "<subnet 1 cidr>"
redshift_serverless_subnet_2_cidr = "<subnet 2 cidr>"
redshift_serverless_subnet_3_cidr = "<subnet 3 cidr>"
redshift_serverless_vpc_route_cidr_block = "0.0.0.0/0"

###################################
## Redshift Serverless Variables ##
###################################
redshift_serverless_namespace_name      = "namespace name"
redshift_serverless_database_name       = "<db name>" //must contain only lowercase alphanumeric characters, underscores, and dollar signs
redshift_serverless_admin_username      = "<your-username>"
redshift_serverless_admin_password      = <your-password>
redshift_serverless_workgroup_name      = "<workgroup name>"
redshift_serverless_base_capacity       = 32 // 32 RPUs to 512 RPUs in units of 8 (32,40,48...512)
redshift_serverless_publicly_accessible = true