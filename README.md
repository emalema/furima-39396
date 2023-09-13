# README
# DB設計

## users table

| Column             | Type       | Options                                |
| ------------------ |----------  |--------------------------------------- |
| nickname           | string     | null:false                             |
| email              | string     | null:false,unique:true                 |
| encrypted_password | string     | null:false                             |
| first_name         | string     | null:false                             |
| last_name          | string     | null:false                             |
| first_name_kana    | string     | null:false                             |
| last_name_kana     | string     | null:false                             |
| date_of_birth      | date       | null:false                             |

## Association
- has_many :items
- has_many :orders

## items table

| Column             | Type       | Options                                |
| ------------------ |----------  |--------------------------------------- |
| name               | string     | null:false                             |
| price              | integer    | null:false                             |
| description        | text       | null:false                             |
| item_condition_id  | string     | null:false                             |
| category_id        | integer    | null:false                             |
| shipping_fee_id    | integer    | null:false                             |
| prefecture_id      | integer    | null:false                             |
| shipping_date_id   | integer    | null:false                             |
| user               | references | null:false ,foreign_key:true           |

## Association
- belongs_to :user
- has_one:order

## orders table

| Column             | Type       | Options                                |
| ------------------ |----------  |--------------------------------------- |
| user               | references | null:false,foreign_key:true            |
| item               | references | null:false,foreign_key:true            |

## Association
- belongs_to :user
- belongs_to :item
- has_one :payment


## payments table

| Column             | Type       | Options                                |
| ------------------ |----------  |--------------------------------------- |
| post_code          | string     | null:false                             |
| prefecture_id      | string     | null:false                             |
| city               | string     | null:false                             |
| address            | string     | null:false                             |
| building           | string     |                                        |
| phone_number       | string     | null:false                             |
| order              | references | null:false,foreign_key:true            |

## Association
- belongs_to :order
