# Reizo

![reizo](https://i.gyazo.com/2009242fd459921feba5830bddb51a36.jpg)

## アプリケーション概要

誰でも簡単に「食材管理」「賞味期限チェック」ができ、冷蔵庫のお悩みを解決します。  
このアプリでは、

  1. 冷蔵庫の食材を登録・管理  
  2. 食材のキーワード・カテゴリー・賞味期限検索  
  3. 賞味期限のチェック  

が可能になります。

開発環境

- MacBook Pro (13-inch, 2020, Two Thunderbolt 3 ports)
- macOS Catalina (10.15.6)
- Ruby
- Ruby on Rails
- JavaScript
- MySQL
- GitHub
- Heroku
- Visual Studio Code 

## URL

[アプリケーションURL](https://reizo-daichikawakami.herokuapp.com/)

## テスト用アカウント等

### ID/Pass

| ID    | Pass |
| ----- | ---- |
| admin | 2222 |

### アカウント

| メールアドレス  | パスワード |
| ------------- | -------- |
| hoge@hoge.com | 1111qqqq |

## 利用方法

ヘッダーの新規登録ボタンからアカウント登録をしてください。  
  (テスト用アカウントご利用の場合は、ヘッダーのログインボタンからログインしてください。)  
登録後、右下の食材登録ボタンから食材の情報を入力してください。  
食材登録後、トップページに表示されます。  
食材の情報を編集・削除する際は、編集したい食材をクリックし、編集ページから行ってください。  
トップページの検索バーから、食材のキーワード・カテゴリー・賞味期限検索が可能です。  

## 目指した課題解決

- 冷蔵庫の中身を確認してから、買い物に行くのが面倒くさい
- 冷蔵庫にある食材を間違えて、新たに買ってきてしまうことがある
- いつの間にか、食材が賞味期限切れになっていることがある

**以上のことから、外からでも冷蔵庫の中身を管理・参照できるアプリケーションを作成しました。**

冷蔵庫の中身は、非常に多くの食材が入っています。そこで、キーワード・カテゴリー・賞味期限の3つの条件から食材を検索できるようにしています。また、食材は賞味期限が近い順に上から表示されるため、賞味期限が切れそうな食材を把握することができます。

## 洗い出した要件

| 機能 | 目的  | 詳細 |
| ---------------- | ---- | --- |
| ユーザー登録機能    | ユーザーアカウントの登録、ログイン、ログアウトを可能にする | devise導入で、新規登録、ログイン、ログアウトを可能にする |
| 食材登録機能       | ユーザーが食材を登録できるようにする | 食材登録ボタンから、入力した食材情報を登録できるようにする |
| 食材表示機能       | 登録した食材情報を一覧表示できるようにする | ログイン中のユーザーが登録した、食材一覧を賞味期限が近い順に表示させる |
| 食材編集機能       | 登録されている食材を編集できるようにする | 表示された食材をクリックし、編集ページから食材の編集・更新を可能にする |
| 食材削除機能       | 登録されている食材を削除できるようにする | 表示された食材をクリックし、編集ページから食材の削除を可能にする |
| 食材検索機能       | 登録されている食材を簡単に検索できるようにする | キーワード、カテゴリー、賞味期限の複数条件からの食材検索を可能にする |
| 賞味期限チェック機能 | 登録されている賞味期限が近い食材を簡単にチェックできるようにする | 日付が賞味期限の7日前になると、食材が赤く表示されるようにする |
| SNS認証 | ユーザーアカウント登録方法の選択肢を増やす | SNSアカウント（Googleアカウント、Facebookアカウント）を利用したログイン方法を選択肢として追加する |

## 実装した機能についてのGIFと説明

①ユーザー登録機能  
  - 登録後は、ログイン・ログアウトが可能になる  

  ![registration](https://user-images.githubusercontent.com/72439451/100332894-4d0bd680-3015-11eb-8d55-b72e9ee4f09c.gif)

②食材登録機能〜食材表示機能  
  - 食材登録フォームに食材情報を入力する
  - 登録ボタンを押すと、トップページに登録した食材が表示される
  - 食材を登録していない場合は、ダミーテキストが表示される  

  ![new-food](https://user-images.githubusercontent.com/72439451/100335010-d1f7ef80-3017-11eb-927f-9ada0b07c3b8.gif)

③食材編集機能  
  - 食材編集フォームから食材の編集・更新ができる
  - 変更ボタンを押すと、トップページに編集された食材が表示される  

  ![edit](https://user-images.githubusercontent.com/72439451/100336141-264f9f00-3019-11eb-8018-a6de9ba185b9.gif)

④食材削除機能  
  - 食材編集フォームから食材の削除ができる
  - 削除ボタンを押すと、登録していた食材が削除される  

  ![delete](https://user-images.githubusercontent.com/72439451/100336657-cc030e00-3019-11eb-94c3-8107b4ebfa75.gif)

⑤食材検索機能  
  - トップページの検索バーから食材検索ができる
  - キーワード・カテゴリー・賞味期限の条件を指定する(一つの条件指定でも可能)
  - 賞味期限は入力した日付以降の食材が表示される
  - 条件にヒットする食材が一覧表示される
  - 条件を指定しない場合は、全ての食材が表示される
  - 条件と一致しない場合は、「一致する食材がありません」と表示される  

  ![search](https://user-images.githubusercontent.com/72439451/100338298-c1497880-301b-11eb-8b49-e45044baae6e.gif)

⑥賞味期限チェック機能  
  - 「賞味期限の7日前」になると、食材がオレンジ色に表示される
  - 「賞味期限切れ」「賞味期限当日」の食材は赤く表示される  

  ![bb_date](https://user-images.githubusercontent.com/72439451/100523131-67021080-31f1-11eb-9505-98869f32db7f.gif)

## 実装予定の機能

- 結合テストを実装し、アプリケーションの品質を向上させる
- SNSアカウント（Googleアカウント、Facebookアカウント）を利用したログイン方法を選択肢として追加する
- AWSのサーバーに変更

# データベース設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :foods

## foodsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| num         | integer    | null: false                    |
| unit_id     | integer    | null: false                    |
| bb_date     | date       | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## ER図

![ER図](https://i.gyazo.com/ae87850b8bdc32a7a6bb87ca6406b376.png)

## ローカルでの動作方法

```
% git clone https://github.com/daichi0112/reizo.git
% cd reizo
% bundle install
% yarn install
% rails db:create
% rails db:migrate
```

