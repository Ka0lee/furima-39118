# テーブル設計

## users テーブル

| Column                   | Type    | Options                  |
| ------------------------ | ------- | ------------------------ |
| nickname                 | string  | null: false              |
| email                    | string  | null: false,unique:true  |
| encrypted_password       | string  | null: false              |
| password_confirmation    | string  | null: false              |
| last_name                | string  | null: false              |
| first_name               | string  | null: false              |
| last_name_kana           | string  | null: false              |
| first_name_kana          | string  | null: false              |
| birth_date               | date    | null: false              |

### Association

- has_many :items 
- has_many :orders 


## orders テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| item      | references | null: false,foreign_key: true |
| user      | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :pay_form


## pay_form テーブル


| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | null: false                   |
| city          | string     | null: false                   |
| addresses     | string     | null: false                   |
| prefecture_id | integer    | null: false,foreign_key: true |
| buildeing     | string     |                               |
| phone_number  | string     | null: false                   |
| order         | references | null: false,foreign_key: true |

### Association

- belongs_to :order

## items テーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| name                    | string     | null: false                   |
| price                   | integer    | null: false                   |
| info                    | text       | null: false                   |
| category_id             | integer    | null: false,foreign_key: true |
| sales_status_id         | integer    | null: false,foreign_key: true |
| shipping_fee_status_id  | integer    | null: false,foreign_key: true |
| prefecture_id           | integer    | null: false,foreign_key: true |
| scheduled_delivery_id   | integer    | null: false,foreign_key: true |
| user                    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :order
