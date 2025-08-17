# terraform/variables.tf（安全版サンプル）
variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }
variable "client_id"       { type = string }

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "location"       { type = string }
# ほか必要な変数（admin_username など）も同様に default を消す
