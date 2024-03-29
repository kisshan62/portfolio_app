## サイトリンク

https://goalme.net

ゲストログイン機能がありますので、ログイン画面の「ゲストログイン（閲覧用）」ボタンから閲覧できます。

![guest_login](https://user-images.githubusercontent.com/60570329/202889327-45570040-2625-44e8-af00-97c7e8296a8d.gif)

## サイト概要

目標達成を支援するアプリ。  
目標投稿の際に期日管理、最終目標までの小目標を設定、また、他のユーザとシェアすることで達成までのモチベーションを維持することが目的。
ユーザをフォローすることでそのユーザの投稿が画面に表示され、コメント、いいねをすることで応援することができる。
目標達成後は完了とすることで未達成のものと区別が可能。

サイトトップ画面
![top](https://user-images.githubusercontent.com/60570329/202890190-ccb7b5e0-7e82-4344-b053-9990d8abd931.png)

ユーザトップ画面
![user_top](https://user-images.githubusercontent.com/60570329/202890200-b00827c4-8096-4a52-8e2e-4fd3b7661d11.gif)


## 開発環境
・Windows10  
・Docker-Desktop4.4.4  
・VSCode  


## 使用技術

・MySQL  
・nginx,puma  
・Javascript  
・jQuery  
・Ruby 2.6.6, Rails 6.0.3.2  
・CircleCi（テスト・デプロイ）  
・RSpec（テストフレームワーク）  
・Docker,Docker-compose（開発環境）  
・AWS/本番環境（ECR, ECS, RDS, VPC, EIP, Route53, IAM）  
・VSCode, Vim  

インフラ構成
![system_configuration](https://user-images.githubusercontent.com/60570329/202889335-4a475946-5d14-45b1-8ecc-ff8d2216b7b6.png)


## 機能一覧

◆ユーザー機能（deviseを使用）  
・新規登録  
Eメールアドレス認証機能  
外部サービスアカウント登録（google,twitter）  
・ログイン、ログアウト、かんたんログイン機能（閲覧用）  
・マイページ、登録情報編集  

◆投稿機能  
・一覧表示、記事詳細表示、投稿、編集、削除機能  
・画像のアップロード機能  

◆レビューコメント機能  
・コメント表示、コメント投稿、コメント編集、コメント削除機能  

◆ブックマーク機能  
・ブックマーク作成と削除(Ajax)  

◆通知機能  
・他ユーザからのフォローされた場合の通知機能  
　（新規通知がある場合はオレンジボールを表示）  

◆検索機能  
・ユーザ・投稿検索、タブからの選択検索  

## 今後実装したい項目

・javascriptフレームワークの導入（Vue.jsでSPA形式にしてユーザーエクスペリエンスを向上させる）  
・SNS連携投稿機能  
