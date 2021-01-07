# README

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |　ユーザー名
| email            | string | null: false |　メール
| password         | string | null: false |　パス
| password_confirm | string | null: false |　パス確認
| zenkaku          | string | null: false |　全角名前
| katakana         | string | null: false |　カナ名前
| birthday         | string | null: false |　誕生日

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| image         |               | ActiveStorage                  |　画像
| title         | string        | null: false                    |　商品名
| text          | text          | null: false                    |　用品詳細
| category      | string        | null: false                    |　カテゴリー
| state         | string        | null: false                    |　商品の状態
| price         | integer       | null: false                    |　価格
| user          | references    | null: false, foreign_key: true |

### Association

- belongs_to :user

## orders テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| burden        | string        | null: false                    |　配送料負担
| area          | string        | null: false                    |　発送元地域
| days          | integer       | null: false                    |　発送までの日数
| credit_num    | integer       | null: false                    |　クレジット情報
| credit_date   | integer       | null: false                    |　有効期限
| security      | integer       | null: false                    |　セキュリティ番号
| user          | references    | null: false, foreign_key: true |　
| item          | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :info

## infos テーブル

| Column        |  Type         | Options                        |
| --------------| ------------- | ------------------------------ |
| post_num      | integer       | null: false                    |　郵便番号
| city          | string        | null: false                    |　都道府県
| municipal     | string        | null: false                    |　市区町村
| address       | integer       | null: false                    |　番地
| build_name    | integer       | null: false                    |　建物名
| phone_num     | integer       | null: false                    |　電話番号
| order         | references    | null: false, foreign_key: true |

### Association

- belongs_to :order