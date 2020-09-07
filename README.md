# Breakin'-Community

![result](https://user-images.githubusercontent.com/64772703/92210046-ffc21200-eec8-11ea-9d79-547c58767d1c.gif)
## 概要
現在ポートフォリオとして作成中の<br>
**ブレイクダンサーのコミュニティを活性化させること** をコンセプトとした練習場所共有アプリケーションです！<br><br>
・新たな練習場所を発見したり、自分の知っている練習場所を登録することができます。<br>
・また、練習場所ごとの掲示板を使用して一緒に練習する新しい仲間を作ることもできます。

## App URL
https://breakin-community.herokuapp.com/

## 制作背景
大学からブレイクダンスに没頭し、社会人でも続けていましたが、<br>
３回引越しを経験しており、その度に **新たな仲間や練習場所を見つけることが困難でした** 。<br>
<br>
**ダンスの面白さは仲間と切磋琢磨し合うことがなければ感じることができません**<br>
故に、社会人になって仲間と疎遠になり、1人で練習しても面白くなくてやめてしまった方がたくさんいます。<br>
ならば、一緒に練習できる仲間や練習場所を見つけて交流ができるようなアプリケーションを制作すれば良いと考えました！
<br>
このアプリでは上記の課題を解決できるだけでなく、なおかつ頑張っている仲間を見てモチベーションアップを図ることもできます！！

## 工夫したポイント
ひと目見るだけで使い方がわかるようにシンプルにしました。<br>
また、ユーザーの使いやすさを重視して、検索機能や日本の各地点に飛べるリンクを作成したり、<br>
トップページで詳細を表示させることでその練習場所に興味を持ってもらえるようにしています。

## 本番環境
<dl>
  <dt>インフラ</dt>
  <dd>AWS( EC2 ) / heroku
  
  <dt>フロントエンド</dt>
  <dd>JavaScript / HTML / CSS</dd>
  
  
  <dt>バックエンド</dt>
  <dd>Ruby 2.6.5 / Rails 6.0.3.2

  <dt>データベース</dt>
  <dd>MySQL5.6.47</dd>Redis
  <dd>Redis</dd>
  
  <dt>Webサーバ</dt>
  <dd>Nginx</dd>
  
  <dt>APサーバ</dt>
  <dd>Puma</dd>
  
  <dt>テスト/デプロイ</dt>
  <dd>Rubocop / Rspec / Capistrano</dd>
</dl>

## 課題や今後実装したい機能
セッションでログイン保持
## クラウドアーキテクチャ

## 機能一覧
<dl>
  <dt>ユーザー管理機能</dt>
  <dd>ゲストログイン / ゲストユーザー編集・削除・Eメール再設定不可  新規登録 / 更新 / 削除</dd>
  <dt>練習場所管理機能</dt>
  <dd>新規登録 / 更新 / 削除 / 検索 / チャットページ</dd>
  <dt>練習場所のチャットページ(その練習場所を登録したユーザーの場合)</dt>
  <dd>練習場所の情報の更新 / 削除 / メッセージ閲覧 / メッセージ送信 / </dd>
  <dt>練習場所のチャットページ(チャット参加者の場合)</dt>
  <dd>メッセージ閲覧 / メッセージ送信 </dd>
  <dt>練習場所のチャットページ(チャットに参加していない場合)</dt>
  <dd>メッセージ閲覧</dd>
<dl>

