# README

## usersテーブル

| Column              | Type     | Options            |
| ------------------- | -------- | -------------------|
| nickname            | string   | null: false        |
| email               | string   | null: false unique |
| encrypted_password  | string   | null: false        |

### Association
- has_many :evetts
- has_many :payments
- has_many :followed
- has_many :following
- has_many :followed_user
- has_many :following_user
- has_many :sns


## evettsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | -------------------------------|
| name       | string     | null: false                    |
| text       | text       | null: false                    |
| price      | integer    | null: false                    |
| limit_date | date       |                                |
| share_area | integer    |                                |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :payments


## paymentsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | -------------------------------|
| user   | references | null: false, foreign_key: true |
| pay    | integer    | null: false                    |
| evett  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :evett


## friendsテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| followed  | references | null: false, foreign_key: true |
| following | references | null: false, foreign_key: true |

### Association
- belongs_to :followed
- belongs_to :following


## snsテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | -------------------------------|
| provider | string     | null: false                    |
| uid      | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user, optional: true



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
