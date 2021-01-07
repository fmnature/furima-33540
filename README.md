# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |　ユーザー名
| email              | string | null: false |　メール
| encrypted_password | string | null: false |　パス
| first_name_z       | string | null: false |　全角名前
| last_name_z        | string | null: false |　全角苗字
| first_name_k       | string | null: false |　カナ名前
| last_name_k        | string | null: false |　カナ苗字
| birthday           | date   | null: false |　誕生日

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| title         | string        | null: false                    |　商品名
| text          | text          | null: false                    |　用品詳細
| category      | string        | null: false                    |　カテゴリー
| state         | string        | null: false                    |　商品の状態
| price         | integer       | null: false                    |　価格
| burden        | string        | null: false                    |　配送料負担
| area          | string        | null: false                    |　発送元地域
| days          | integer       | null: false                    |　発送までの日数
| user          | references    | null: false, foreign_key: true |

### Association

- belongs_to :user

## orders テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| user          | references    | null: false, foreign_key: true |　
| item          | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :info

## infos テーブル

| Column        |  Type         | Options                        |
| --------------| ------------- | ------------------------------ |
| post_num      | string        | null: false                    |　郵便番号
| city          | string        | null: false                    |　都道府県
| municipal     | string        | null: false                    |　市区町村
| address       | integer       | null: false                    |　番地
| build_name    | integer       |                                |　建物名
| phone_num     | string        | null: false                    |　電話番号
| order         | references    | null: false, foreign_key: true |

### Association

- belongs_to :order