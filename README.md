# テーブル設計

## usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |

### Association
- has_many :products
- has_many :buys

## productテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| text       | text       | null: false                    |
| price      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buyテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| product    | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product