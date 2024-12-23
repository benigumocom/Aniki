# Aniki

```
# ブランチを作成
$ git checkout -b feature/add-login

# ファイルを変更して変更したファイルをコミットする
$ git add .
$ git commit -m "コミットメッセージ"

# GitHubにPushする
$ git push origin feature/add-login

# GitHub上でプルリクエストを送ってマージする

# ブランチをmainに変更する
$ git checkout main

# ローカルのmain(master)ブランチをリモートの最新に更新する
$ git pull origin main --rebase

# 1.で切った作業用ブランチを削除する
$ git branch -d <ブランチ名>
```
