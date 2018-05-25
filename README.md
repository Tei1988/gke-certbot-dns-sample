# GKEで動くワイルドカードSSL証明書発行&登録CronJob

利用したいドメインをGoogle Cloud DNSに移行しておいてください。
ドメインなどは`<your domain>`といった形で仮置きしているので、適切に修正してください。

- デプロイ
```console
kubectl apply -f k8s
```
- 削除
```console
kubectl delete -f k8s
```

## ConfigMap
- **entrypoint.sh**  
  CertbotとGoogle Cloud DNSのプラグインを使って、ドメインのワイルドカード証明書を取得するスクリプトです。  
  `*.<your domain>`, `*.stg.<your domain>`, `<your domain>`を指定しています。
  `stg`が不要の場合は、スクリプトから削除してください。
  (`<your domain>`は環境変数から渡します。)

## CronJob

毎月01日00時00分(UTC)に証明書更新Jobを実行させます。

## PersistentVolumeClaim
下記`delete`実行すると永続化されていたデータも消えます。
```console
kubectl delete -f certbot/persistent_volume_claim.yaml
kubectl create -f certbot/persistent_volume_claim.yaml
```

certbotの前回実行時の記録や証明書を保持しています。
（LBに登録されるので、実際のところ永続化は不要かもしれません。）

## Secret
### credentials.json
Cloud DNSに書き込み権限を持ったサービスアカウントの、JSON秘密鍵をBase64でエンコードした文字列を記載します。

例: `cat credentials.json | base64`
