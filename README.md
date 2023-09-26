# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| password            | string  | null: false               |
| last_name           | string  | null: false               |
| last_kana           | string  | null: false               |
| first_name          | string  | null: false               |
| first_kana          | string  | null: false               |
| birth_year          | integer | null: false               |
| birth_month         | integer | null: false               |
| birth_day           | integer | null: false               |

### Association

- has_many :items
- has_many :buy_records

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | text       | null: false                    |
| name          | string     | null: false                    |
| info          | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| del_burden    | string     | null: false                    |
| del_area      | string     | null: false                    |
| del_day       | string     | null: false                    |
| price         | integer    | null: false                    |
| price_tax     | integer    | null: false                    |
| sales_profit  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :buy_records
- belongs_to :user

## buy_records テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item                 | references | null: false, foreign_key: true |
| delivery_destination | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

### Association

- has_one :delivery_destination
- belongs_to :item
- belongs_to :user

## delivery_destinations テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| post_code            | string     | null: false |
| prefecture           | string     | null: false |
| area                 | string     | null: false |
| address              | string     | null: false |
| build_name           | string     |             |
| tel                  | string     | null: false |

### Association

- belongs_to :buy_records