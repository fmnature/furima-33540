# README

## users テーブル ユーザー情報

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

## items テーブル 商品情報

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| title         | string        | null: false                    |　商品名
| text          | text          | null: false                    |　用品詳細
| price         | integer       | null: false                    |　価格
| genre_id      | integer       | null: false                    |　カテゴリー Active_hash
| state_id      | integer       | null: false                    |　商品の状態 Active_hash
| burden_id     | integer       | null: false                    |　配送料負担 Active_hash
| area_id       | integer       | null: false                    |　発送元地域 Active_hash
| day_id        | integer       | null: false                    |　発送までの日数 Active_hash
| user          | references    | null: false, foreign_key: true |　配送者

### Association

- belongs_to :user
- has_one :order

## orders テーブル 購入記録

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| user          | references    | null: false, foreign_key: true |　購入者
| item          | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :info

## infos テーブル 住所

| Column        |  Type         | Options                        |
| --------------| ------------- | ------------------------------ |
| post_num      | string        | null: false                    |　郵便番号
| area_id       | integer       | null: false                    |　都道府県 Active_hash
| municipal     | string        | null: false                    |　市区町村
| address       | string        | null: false                    |　番地
| build_name    | string        |                                |　建物名
| phone_num     | string        | null: false                    |　電話番号
| order         | references    | null: false, foreign_key: true |

### Association

- belongs_to :order