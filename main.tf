module "network" {
  source       = "./modules/network"
  network_name = var.network_name
}

module "mysql" {
  source              = "./modules/mysql"
  network_name        = var.network_name
  mysql_root_password = var.mysql_root_password
  mysql_database      = var.mysql_database
  mysql_user          = var.mysql_user
  mysql_password      = var.mysql_password

  depends_on = [module.network]
}

module "flask_app" {
  source       = "./modules/flask"
  network_name = var.network_name

  depends_on = [module.mysql, module.network]
}
