module "sql" {
  source              = "../../modules/sql"
  resource_group_name = "demo-rg"
  location            = "westeurope"
  sql_server_name     = "demosqlserver12345"
  sql_admin           = "sqladminuser"
  sql_password        = "SuperSecurePassword123!"
}
