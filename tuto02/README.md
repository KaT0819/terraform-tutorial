# terraform-tutorial


## チュートリアル２
GCPサービス

### 準備
``` shell
# プロジェクト名
export PROJECT_ID={プロジェクトID}
# gcloudコマンドでプロジェク トを切り替える
gcloud config set project ${PROJECT_ID}

Updated property [core/project].
```

``` shell
# サービス名
export SERVICE_ID=mlservice
# プロジェクトにサービスアカウントを作成（ここでは mlservice という名称で作成）
gcloud iam service-accounts create ${SERVICE_ID}

Created service account [mlservice].
```

``` shell
# サービスアカウントに権限を追加
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
--member "serviceAccount:${SERVICE_ID}@${PROJECT_ID}.iam.gserviceaccount.com" \
--role "roles/editor"

# サービスアカウントキーの作成
gcloud iam service-accounts keys create credential.json \
--iam-account ${SERVICE_ID}@${PROJECT_ID}.iam.gserviceaccount.com
```

``` shell
# 実行環境の環境変数にサービスアカウントを設定
export GOOGLE_APPLICATION_CREDENTIALS=${PWD}/credential.json
cat ${GOOGLE_APPLICATION_CREDENTIALS}
```

``` shell
# 初期化
terraform init

# デプロイ
terraform apply

# 削除
terraform destroy

open http://localhost:8888
```
