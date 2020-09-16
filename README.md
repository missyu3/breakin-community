# Breakin'-Community

![result](https://user-images.githubusercontent.com/64772703/93018784-41f7fb80-f60d-11ea-81d4-8d09e6315348.gif)
## 概要
ブレイクダンスの練習場所を共有できるアプリケーションです<br><br>
・新たな練習場所を発見したり、自分の知っている練習場所を登録することができます。<br>
・練習場所ごとのチャットを利用して一緒に練習する新しい仲間を作ることもできます。

## App URL
https://breakin-community.com/

## 機能一覧
<dl>
  <dt>ユーザー管理機能</dt>
  <dt>ゲストログイン機能</dt>
  <dt>トップページにgoogle map表示</dt>
  <dt></dt>
  <dt></dt>
  <dt></dt>
  <dt></dt>
  <dt></dt>
  <dt>練習場所管理機能</dt>
  <dt>非同期チャット機能</dt>
  <dt>ユーザーマイページ機能</dt>


<dl>

## 使用技術
<dl>
  <dt>AWS( EC2 / S3 / Route53 / ALB / RDS / ElastiCache )<dt>
  <dt>JavaScript</dt>
  <dt>Ruby 2.6.5</dt>
  <dt>Rails 6.0.3.2<dt>
  <dt>MySQL5.6.47</dt>
  <dt>Redis</dt>
  <dt>Nginx</dt>
  <dt>Unicorn</dt>
  <dt>Rubocop / Rspec / Capistrano</dt>
  <dt>Google API ( Maps Javascript API / Geocoding API )
  <dt>Git / GitHub</dt>
</dl>

## 課題や今後実装したい機能
結合テストコード
docker

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
