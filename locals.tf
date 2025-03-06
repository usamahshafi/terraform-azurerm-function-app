locals {
  prefix = var.prefix

  resource_group_name = "${local.prefix}-rg" 
  storage_account_name = lower("${local.prefix}13671283sa")
  app_service_plan_name    = "${local.prefix}-asp"
  function_app_name    = "${local.prefix}-fa"
}