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
  フォロー機能<br>
  トップページにmapに登録された練習場所の一覧表示<br>
  トップページの練習場所をクリックすると詳細を非同期で表示<br>
  レスポンシブデザイン(スマホ・タブレット)

## 使用技術
  AWS( ACM / ALB / EC2 / ElastiCache / RDS / Route53 / S3 )<br>
  Docker / Docker-Compose<br>
  Travis CI<br>
  JavaScript<br>
  Ruby 2.6.5<br>
  Rails 6.0.0<br>
  MySQL2<br>
  Redis<br>
  Nginx<br>
  Unicorn<br>
  Rubocop / Rspec / Capistrano<br>
  Google API ( Maps Javascript API / Geocoding API )<br>
  Git / GitHub

## インフラ構成図
![クラウドアーキテクチャ (1)](https://user-images.githubusercontent.com/64772703/95868321-0d5e9780-0da5-11eb-8e44-d7573869c54c.jpg)

## 制作背景
引越しや転勤があっても趣味を続けられるようなアプリを制作したかったからです。<br>
私の趣味は大学から続けているブレイクダンスなのですが、<br>
私の周りで社会人になってダンスをやめてしまった人がたくさんいます。<br>
一番の理由は続けたいと思っていても練習場所や練習仲間が見つからないためにやめてしまうからだそうで、<br>
ならば、練習場所を共有でき、ユーザー同士で交流ができるようなアプリケーションを制作すれば良いと考えました！<br><br>

ターゲットはブレイクダンスをしている方で、<br>
引越しした方はもちろん、これから引越ししようとしている人の役に立ちますし、<br>
他の人と交流することによって練習のモチベーションを向上できたり<br>
ダンスに関する情報収集、発信をすることができます。<br>

## 工夫したポイント
ひと目見るだけで使い方がわかるようにシンプルにしました。<br>
また、ユーザーの使いやすさを重視して、検索機能や日本の各地点に飛べるリンクを作成したり、<br>
トップページで詳細を表示させることでその練習場所に興味を持ってもらえるようにしています。
