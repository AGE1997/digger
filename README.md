# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Colum                | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| last_name            | string | null: false               |
| first_name           | string | null: false               |
| pseudonym_last_name  | string | null: false               |
| pseudonym_first_name | string | null: false               |
| telephone_number     | string | null: false, unique: true |

### Association

- has_one  :profiles
- has_many :videos
- has_many :orders
- has_many :comments


## profile テーブル

| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| nickname      | string     | null: false                    |
| genre_id      | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| birthday      | date       | null: false                    |
| biography     | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## videos テーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| introduction        | text       | null: false                    |
| genre_id            | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :video_orders
- has_many   :orders, through: :video_orders


## orders テーブル

| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| prefecture_id  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :video_orders
- has_many   :videos, through: :video_orders


## comments テーブル

| Colum | Type  | Options     |
| ----- | ----- | ----------- |
| value | float | null: false |
| text  | text  | null: false |

### Association

- belongs_to :user
- belongs_to :videos