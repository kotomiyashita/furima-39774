# README

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| date_of_birth      | integer | null: false |

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false                    |
| image              | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | string     | null: false                    |
| category_id        | string     | null: false                    |
| condition_id       | string     | null: false                    |
| shipping fee_id    | string     | null: false                    |
| ship-from          | integer    | null: false                    |
| estimated_shipping | integer    | null: false                    |


## comment テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| content | string     | null: false                    |

## orders  テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

## shippinginfos  テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| oder         | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address1     | string     | null: false                    |
| address2     | string     | null: false                    |
| phone_number | string     | null: false                    |