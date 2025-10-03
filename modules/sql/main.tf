variable "resource_group_name" {
  type = string 
}

variable "location" {
  type = string 
}

variable "sql_server_name" {
  type = string 
}

variable "sql_admin" { 
  type = string 
}

variable "sql_password" { 
  type = string 
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_sql_server" "sql" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin
  administrator_login_password = var.sql_password
}

resource "azurerm_sql_database" "db" {
  name                = "demo-db"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  server_name         = azurerm_sql_server.sql.name
  edition             = "Basic"
}
