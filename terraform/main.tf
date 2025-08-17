# main.tf - Terraform構成のエントリポイントファイル
# 実際のリソース定義は以下のファイルに分割されています。

# provider.tf: Azureの認証情報（subscription_id, client_idなど）を定義
# variables.tf: 全体で使用する変数（locationなど）を定義
# network.tf: リソースグループ、仮想ネットワーク、サブネット、NIC、パブリックIPなどのネットワーク関連リソースを定義
# compute.tf: Azure上に作成する仮想マシン（VM）に関する定義
# outputs.tf: 作成したリソースの出力（例：パブリックIP）を定義

# このファイル自体にリソース定義は含まれていませんが、構成の起点として利用しています。

