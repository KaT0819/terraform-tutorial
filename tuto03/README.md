# terraform-tutorial
https://learn.hashicorp.com/collections/terraform/aws-get-started

## チュートリアル３
AWSサービス

### 準備
``` shell
# terraform用のユーザを別途作成し、アクセスキー、シークレットキーを取得

# アクセスキー、シークレットキーを設定するterraform.tfvarsを作成
cp ./terraform.tfvars.sample ./terraform.tfvars

# terraform.tfvarsにアクセスキー、シークレットキーを設定

# 初期化
terraform init

```

### 検証
``` shell
# フォーマット
terraform fmt

# 検証
terraform validate

```

### デプロイ
``` shell
# デプロイ
terraform apply
```

### 状態確認
``` shell
terraform show

terraform state list
```


### パラメータを指定したデプロイ
``` shell
terraform apply -var "instance_name=YetAnotherName"
```


# Appendix
## コマンド
``` shell
# ローカルのconfig設定・確認
aws configure --terraform


```

## リージョンの変更
本実装は東京リージョン（ap-northeast-1）で構築している。
他リージョンにする場合はmain.tfの以下を変更する
- provider "aws" の region
- resource "aws_instance" "app_server" の ami

指定したリージョンに合ったAMIである必要がある。
AMIを探す詳細は以下
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html#finding-quick-start-ami
コンソールからEC2のページに行き、
AMI カタログのAmazon LinuxのAMIを選択すると表示されるAMIの値で確認するのが楽

## エラー
チュートリアルのBuild Infrastructureにて手順通り進めると、terraform applyが失敗する。
``` shell
│ Error: Error launching source instance: UnauthorizedOperation: You are not authorized to perform this operation. Encoded authorization failure message: 25M-UQB9sVFEujePaeJ1gtsgGXEHYula ...
│       status code: 403, request id: 059455b4-52a1-4259-9547-83a3cf49587d
│
│   with aws_instance.app_server,
│   on main.tf line 23, in resource "aws_instance" "app_server":
│   23: resource "aws_instance" "app_server" {
│
╵
make: *** [apply] Error 1
```

環境変数が上手く読み込めないと思われる。Windowsのみ？
代替として本手順では、terraform.tfvarsに値を持たせ、そちらをmain.tfで参照する方法を取っている。
profileを指定する方法も同様のエラーが発生
