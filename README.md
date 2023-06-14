# テーブル設計

## users テーブル

| Column                   | Type    | Options       |
| ------------------------ | ------- | ------------- |
| nickname                 | string  | null: false,  |
| email                    | string  | null: false,  |
| encrypted_password       | string  | null: false   |
| password_confirmation    | string  | null: false   |
| last_name                | string  | null: false   |
| first_name               | string  | null: false   |
| last_name_kana           | string  | null: false   |
| first_name_kana          | string  | null: false   |
| birth_date               | date    | null: false   |

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
- has_one :item
- has_one :pay_form


## pay_form テーブル


| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | null: false                   |
| city          | string     | null: false                   |
| addresses     | string     | null: false                   |
| prefecture_id | references | null: false,foreign_key: true |
| buildeing     | string     | null: false                   |
| phone_number  | string     | null: false                   |
| orders        | references | null: false,foreign_key: true |

### Association

- has_one :order

## items テーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| name                    | string     | null: false                   |
| price                   | integer    | null: false                   |
| category_id             | references | null: false,foreign_key: true |
| sales_status_id         | references | null: false,foreign_key: true |
| shipping_fee_status_id  | references | null: false,foreign_key: true |
| prefecture_id           | references | null: false,foreign_key: true |
| scheduled_delivery_id   | references | null: false,foreign_key: true |
| user                    | references | null: false,foreign_key: true |

### Association

- has_many :comments
- belongs_to :user  
- has_one :order



## comments テーブル

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| id        | integer      | null: false                    |
| text      | text         | null: false                    |
| user_id   | references   | null: false, foreign_key: true |
| item_id   | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## categories テーブル

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| id        | integer      | null: false                    |
| name      | string       | null: false                    |
| item_id   | references   | null: false, foreign_key: true |

### Association

- had_many :items


## sales_statuses テーブル

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| id        | integer      | null: false                    |
| status    | string         | null: false                    |
| item_id   | references   | null: false, foreign_key: true |

### Association

- had_one :items

## shipping_fee_status テーブル

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| id        | integer      | null: false                    |
| ship_day  | integer      | null: false                    |
| item_id   | references   | null: false, foreign_key: true |

### Association

- had_one :items




## scheduled_delivery テーブル

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| id        | integer      | null: false                    |
| day       | integer      | null: false                    |
| item_id   | references   | null: false, foreign_key: true |

### Association

- had_one :items



## prefecture テーブル

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| id        | integer      | null: false                    |
| name      | integer      | null: false                    |
| item_id   | references   | null: false, foreign_key: true |

### Association

- had_one :items


