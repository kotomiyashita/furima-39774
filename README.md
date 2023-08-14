# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| family_name        | string  | null: false              |
| first_name         | string  | null: false              |
| family_name_kana   | string  | null: false              |
| first_name_kana    | string  | null: false              |
| date_of_birth      | date    | null: false              |

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| title                 | string     | null: false                    |
| price                 | integer    | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| shipping_fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| estimated_shipping_id | integer    | null: false                    |

- has_many :comments
- has_one :order
- belongs_to :user


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| content | string     | null: false                    |

- belongs_to :item
- belongs_to :user

## orders  テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- has_one :shippinginfo
- belongs_to :item
- belongs_to :user

## shippinginfos  テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

- belongs_to :order