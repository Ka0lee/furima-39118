# テーブル設計

## users テーブル

| Column                   | Type    | Options                   |
| ------------------------ | ------- | ------------------------- |
| nickname                 | string  | null: false, unique: true |
| email                    | string  | null: false, unique: true |
| encrypted_password       | string  | null: false  unique: true |
| password_confirmation    | string  | null: false               |
| last_name                | string  | null: false               |
| first_name               | string  | null: false               |
| last_name_kana           | string  | null: false               |
| first_name_kana          | string  | null: false               |
| birth_date(1i)           | integer | null: false               |
| birth_date(2i)           | integer | null: false               |
| birth_date(2i)           | integer | null: false               |

### Association

- has_many :items dependent: :destroy
- has_many :orders dependent: :destroy 


## orders テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| id        | integer    |                               |
| item_id   | references | null: false,foreign_key: true |
| user_id   | references | null: false,foreign_key: true |

### Association

- belongs_to :users


##　pay_form テーブル


| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| id            | integer    | null: false                   |
| postal_code   | integer    | null: false                   |
| city          | text       | null: false                   |
| addresses     | string     | null: false                   |
| prefecture    | text       | null: false                   |
| buildeing     | text       | null: false                   |
| phone_number  | integer    | null: false                   |
| user_id       | references | null: false,foreign_key: true |
| item_id       | references | null: false,foreign_key: true |

### Association

- has_one :buyer

## items テーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| name                    | string     | null: false                   |
| image                   | string     | null: false                   |
| price                   | integer    | null: false                   |
| category_id             | references | null: false,foreign_key: true |
| sales_status_id         | references | null: false,foreign_key: true |
| shipping_fee_status_id  | references | null: false,foreign_key: true |
| prefecture_id           | references | null: false,foreign_key: true |
| scheduled_delivery_id   | references | null: false,foreign_key: true |
| user_id                 | references | null: false,foreign_key: true |
| user_id                 | references | null: false,foreign_key: true |

### Association

- has_many :comments
- belongs_to :users  
- has_one :orders



## comments テーブル

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| id        | integer      | null: false                    |
| text      | text         | null: false                    |
| user_id   | references   | null: false, foreign_key: true |
| item_id   | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

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


