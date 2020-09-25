# Breakin'-Community

![result](https://user-images.githubusercontent.com/64772703/93018784-41f7fb80-f60d-11ea-81d4-8d09e6315348.gif)
## 概要
ブレイクダンスの練習場所を共有できるアプリケーションです<br><br>
・新たな練習場所を発見したり、自分の知っている練習場所を登録することができます。<br>
・練習場所ごとのチャットを利用して一緒に練習する新しい仲間を作ることもできます。

## App URL
https://breakin-community.com/

## 機能一覧
  ユーザー管理機能<br>
  ゲストログイン機能<br>
  練習場所管理機能<br>
  ActionCableを用いたリアルタイムチャット機能<br>
  ユーザーマイページ機能<br>
  トップページにmapに登録された練習場所の一覧表示<br>
  トップページの練習場所をクリックすると詳細を非同期で表示<br>
  レスポンシブデザイン(スマホ・タブレット)

## 使用技術
  Travis CI<br>
  Docker / Docker-Compose<br>
  AWS( EC2 / S3 / Route53 / ALB / RDS / ElastiCache )<br>
  JavaScript<br>
  Ruby 2.7.1<br>
  Rails 6.0.3.2<br>
  MySQL2<br>
  Redis<br>
  Nginx<br>
  Unicorn<br>
  Rubocop / Rspec / Capistrano<br>
  Google API ( Maps Javascript API / Geocoding API )<br>
  Git / GitHub

## 課題や今後実装したい機能
結合テストコード
CI / CDパイプライン

## 制作背景
転勤や引っ越しがあっても趣味を続けやすくしたかったからです。<br>
社会人になってから３回引越しを経験しており、その度に 練習場所を見つけることが困難でした。<br>
また、一緒に練習する仲間がいないと楽しくなかったり、1人だと費用が高い場合があります。<br>
ならば、練習場所を共有でき、ユーザー同士で交流ができるようなアプリケーションを制作すれば良いと考えました！<br>
<br>
このアプリケーションでは上記の課題を解決できるだけでなく、<br>
頑張っている仲間を見てモチベーションアップを図ったり、<br>
ダンスに関する情報収集、発信をすることができます。

## 工夫したポイント
ひと目見るだけで使い方がわかるようにシンプルにしました。<br>
また、ユーザーの使いやすさを重視して、検索機能や日本の各地点に飛べるリンクを作成したり、<br>
トップページで詳細を表示させることでその練習場所に興味を持ってもらえるようにしています。
