# Azure VM構築とLAMP環境自動化ポートフォリオ

TerraformとAnsibleを用いて、Azure上にLAMP構成のWebサーバを自動構築しました。
構築されたサーバではアフィリエイト目的のWebサイトをホスティングしています。

## 技術スタック
- Terraform（IaCによるVM構築）
- Ansible（Apache, MySQL, PHPの自動セットアップ）
- Dev Container（開発環境のDocker化）
- Azure（インフラ基盤）

## 構成概要
1. TerraformでAzure上にUbuntu VMを作成
2. AnsibleでLAMP環境を構築（index.php配備）
3. Dev Container上で一連の作業が再現可能

## ディレクトリ構成
.
├── .devcontainer/
├── terraform/
│ └── main.tf
├── ansible/
│ ├── inventory.ini
│ └── lamp.yml
└── README.md