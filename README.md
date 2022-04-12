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


## アプリケーション名
digger-app-1997

## アプリケーション概要
動画を販売、購入できるアプリ

## アプリケーションURL
https://digger-app-1997.herokuapp.com/

## テスト用アカウント情報
* Basic認証ID
digger
* Basic認証PASSWORD
1997
* アカウント
1. メールアドレス
   nihon@maito
   パスワード
   nihon123

2. メールアドレス
   nihon@maiko
   パスワード
   nihon456

## 利用方法
自身が踊っている動画に価値(値段)をつけこのアプリ内に投稿し出品することができる。
また気になる動画を発見すると購入することができる。

## 目指した課題解決
コロナ禍でダンサーがイベントやレッスンのみで収益化を諮るのが難しくなっている。
その課題を解決するために、ダンサーが自身で練習している動画、イベントでのショーケース動画等に価値をつけ投稿し、それを購入してもらうことで、自身のダンスに価値が高まっていき、収益化にもつながる。

## 洗い出した要件
1. SNS認証
2. 動画購入機能
3. 動画検索機能
4. コメント機能
5. フォロー機能
6. 動画投稿機能
7. ランクアップ機能

## 実装した機能についての説明
1. ユーザー管理機能(ウィザード形式)
* ユーザー登録
[![Image from Gyazo](https://i.gyazo.com/563bd5e7356070936616cf7f9a922093.gif)](https://gyazo.com/563bd5e7356070936616cf7f9a922093)

* プロフィール登録
[![Image from Gyazo](https://i.gyazo.com/0d887d2b5862a97c62bc3d69d794c3c5.gif)](https://gyazo.com/0d887d2b5862a97c62bc3d69d794c3c5)

2. 動画投稿機能
[![Image from Gyazo](https://i.gyazo.com/5f9a35d0f8e8354b82421e84dd166ed0.gif)](https://gyazo.com/5f9a35d0f8e8354b82421e84dd166ed0)

3. 動画購入機能
[![Image from Gyazo](https://i.gyazo.com/a2c617c228102d5ccf1a3e1123a5b41a.gif)](https://gyazo.com/a2c617c228102d5ccf1a3e1123a5b41a)

## 実装予定の機能
1. コメント機能
2. 動画検索機能
3. SNS認証
4. ランクアップ機能
5. フォロー機能


# テーブル設計

## users テーブル

| Colum                | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| last_name            | string | null: false               |
| first_name           | string | null: false               |
| pseudonym_last_name  | string | null: false               |
| pseudonym_first_name | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
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
| sex_id        | integer    |                                |
| genre_id      | integer    |                                |
| prefecture_id | integer    |                                |
| birthday      | date       |                                |
| biography     | text       |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- has_many :videos
- has_many :orders


## videos テーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| introduction        | text       | null: false                    |
| genre_id            | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| profile             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :video
- belongs_to :profile
- has_many   :orders
- has_many   :comments


## orders テーブル

| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| prefecture_id  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| profile        | references | null: false, foreign_key: true |
| video          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :video
- belongs_to :profile


## comments テーブル

| Colum | Type  | Options     |
| ----- | ----- | ----------- |
| value | float | null: false |
| text  | text  | null: false |

### Association

- belongs_to :user
- belongs_to :videos

[![Image from Gyazo](https://i.gyazo.com/3d13c3b3d1818fec5d784abcb69b02e3.png)](https://gyazo.com/3d13c3b3d1818fec5d784abcb69b02e3)