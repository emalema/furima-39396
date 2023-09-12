# README
# DB設計

## users table

| Column             | Type       | Options                                |
| ------------------ |----------  |--------------------------------------- |
| nickname           | string     | null:false,unique:true                 |
| email              | string     | null:false,unique:true                 |
| encrypted_password | string     | null:false                             |
| introduction       | text       |                                        |
| first_name         | string     | null:false                             |
| last_name          | string     | null:false                             |
| first_name_kana    | string     | null:false                             |
| last_name_kana     | string     | null:false                             |
| date_of_birth      | date       | null:false                             |

## Association
- has_many :item
- has_many :order
- has_many :comment


## items table

| Column             | Type       | Options                                |
| ------------------ |----------  |--------------------------------------- |
| name               | string     | null:false                             |
| price              | integer    | null:false                             |
| category           | string     | null:false                             |
| brand              | string     | null:false                             |
| color              | string     |                                        |
| size               | string     |                                        |
| product_condition  | string     | null:false                             |
| description        | text       | nill:false                             |
| shipping_fee       | string     | null:false                             |
| ship_from          | string     | null:false                             |
| shipping_date      | date       | null:false                             |
| user_id            | references | null:false ,foreign_key:true           |
| item_id            | string     | null:false ,foreign_key:true           |

## Association
- belongs_to :user
- has_one:oder

## orders table

| Column             | Type       | Options                                |
| ------------------ |----------  |--------------------------------------- |
| oder_id            | references | null:false,foreign_key:true            |
| user_id            | references | null:false,foreign_key:true            |

## Association
- belongs_to :user
- belongs_to :item
- has_one :payment


## payments table

| Column             | Type       | Options                                |
| ------------------ |----------  |--------------------------------------- |
| first_name         | string     | null:false                             |
| last_name          | string     | null:false                             |
| first_name_kana    | string     | null:false                             |
| last_name_kana     | string     | null:false                             |
| post_code          | string     | null:false                             |
| prefecture         | string     | null:false                             |
| city               | string     | null:false                             |
| address            | text       | null:false                             |
| building           | text       |                                        |
| phone_number       | string     | null:false                             |
| oder_id            | references | null:false,foreign_key:true            |

## Association
- belongs_to :oder
