variable "mysql_root_password" {
  type        = string
  description = "MySQL root password"
  sensitive   = true
}

variable "mysql_database" {
  type        = string
  description = "MySQL database name"
}

variable "mysql_user" {
  type        = string
  description = "MySQL user name"
}

variable "mysql_password" {
  type        = string
  description = "MySQL user password"
  sensitive   = true
}

variable "network_name" {
  type        = string
  description = "Name of the Docker network"
}