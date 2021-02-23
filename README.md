# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------  |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_katakana     | string | null: false               |
| last_katakana      | string | null: false               |
| birthday           | string | null: false               |

### Association
- has_many :products
- has_many :buys

## productテーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| title        | string      | null: false                    |
| text         | text        | null: false                    |
| price        | integer     | null: false                    |
| status_id    | integer     | null: false                    |
| category_id  | integer     | null: false                    |
| burden_id    | integer     | null: false                    |
| area_id      | integer     | null: false                    |
| guideline_id | integer     | null: false                    |
| user         | references  | null: false, foreign_key: true |

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
- has_one :address

## addressテーブル

| Column         | Type         | Options                      |
| post_number    | string       | null: false                  |
| area_id        | integer      | null: false                  |
| municipalities | string       | null: false                  |
| house_number   | string       | null: false                  |
| building_name  | string       |                              |
| phone_number   | string       | null: false                  |
| buy            | references | null: false, foreign_key: true |


### Association
- belongs_to :buy