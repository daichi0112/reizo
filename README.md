# Reizo

## 概要

### 冷蔵庫の食材管理

- ユーザー管理機能 
- 食材登録機能
- 食材詳細表示機能
- 食材編集機能
- 食材削除機能

## 制作背景

冷蔵庫にあったのに、間違えて新たに買ってきてしまった経験からこのアプリを開発

## 実装予定の内容

- 検索機能
- カテゴリー別表示機能
- 賞味期限管理機能

# テーブル設計

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
