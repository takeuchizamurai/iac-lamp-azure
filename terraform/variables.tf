# terraform/variables.tf（安全版サンプル）
variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }
variable "client_id"       { type = string }

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "location"       { type = string }

# 自宅/社内など、SSH を許可する送信元 (CIDR) のリスト
variable "allow_ssh_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to SSH (22/tcp)"
  default     = [] 
}

# Web 公開 (80/443) を有効化するか
variable "allow_web" {
  type        = bool
  description = "Allow inbound 80/443 to the VM"
  default     = true
}

# ほか必要な変数（admin_username など）も同様に default を消す
