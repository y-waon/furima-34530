# テーブル設計

## usersテーブル

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------  |
| email              | string | null: false, unique |
| encrypted_password | string | null: false         |
| name               | string | null: false         |
| nickname           | string | null: false         |
| katakana           | string | null: false         |
| birthday           | string | null: false         |

### Association
- has_many :products
- has_many :buys

## productテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| text       | text       | null: false                    |
| price      | string     | null: false                    |
| Category   | string     | null: false                    |
| burden     | string     | null: false                    |
| area       | string     | null: false                    |
| guideline  | string     | null: false                    |
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
- has_one :adress

## adressテーブル

| Column         | Type         | Options                   |
| post_number    | string       | null: false               |
| Prefectures    | string       | null: false               |
| Municipalities | string       | null: false               |
| house_number   | string       | null: false               |
| building_name  | string       | null: false               |
| phone_number   | string       | null: false               |

### Association
- belongs_to :buy