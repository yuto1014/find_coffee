# FIND BEST COFFEEについて
## URL
[http://13.231.227.148/](http://13.231.227.148/)


## コンセプト
### ✔︎コンセプト：自分に合ったハマるコーヒーを見つける

* 課題：　自分に合ったコーヒーを見つけるのが難しい
* 理由：　コーヒーの種類が多く、知る機会に触れることが少ない
* 例：　サブスクサービスがあるがどうしてもラインナップが限られるため自分の好みに出会える確率は低いと考える
* ターゲット：　コーヒーに興味はあるがハマるコーヒーに出会えていないユーザー
* 課題解決法：
1. ユーザーは飲んだコーヒーのテイストをコーヒーマップに当てはめて投稿する<br>
2. ユーザーの投稿をテイスト毎に分類する<br>
3. 投稿したコーヒーのテイストをチャート化してテイストをイメージしやすくする<br>
 →自分の好きなコーヒーを見つけやすく、且つ幅広いコーヒーを知ることができる

## 開発環境

* 言語：　ruby 2.5.7
* フレームワーク:　rails 5.2.4
* バージョン管理:　github
* DB:　mysql2、sqlite3
* インフラ:　AWS

## 実装した機能
###  ✔︎ ユーザー機能
* ユーザー登録機能(devise)
* ログイン機能(devise)
* ユーザー情報編集機能
* 投稿機能(非同期:Ajax/cocoon)
* チャート機能(chart.js)
* カレンダー機能(fullcalender)
* DM機能(ActionCable)
* 通知機能
* 問い合わせ機能(ActionMailer)
* 検索機能
* コメント機能(非同期:Ajax)
* いいね機能(非同期:Ajax)
* フォロー機能(非同期:Ajax)
* ページネーション機能(kaminari)
* おすすめ機能(ユーザーがいいねした投稿と同じテイストデータの投稿を1つ表示)
* 退会機能(論理削除)

### ✔︎管理者機能
* ユーザー一覧機能
* 問い合わせ返信機能
* 投稿一覧機能
* 投稿削除機能
* コメント削除機能
* ユーザー退会機能

### ✔︎その他機能

* レスポンシブ対応













