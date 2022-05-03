# リソースの依存関係
https://learn.hashicorp.com/tutorials/terraform/dependencies?in=terraform/configuration-language


depends_onを用いてデプロイの順序を制限できる。
Terraformがリソースを作成または破棄する順序は、構成ファイル内のリソースが宣言される順序に影響しません。

## 手順

```
# 初期化
terraform init

# モジュールのインストール
terraform get

# デプロイ
terraform apply

# 破棄
terraform destroy
```
