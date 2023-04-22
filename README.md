# テー部設計

##　　usersテーブル
|Column          |Type  |Options                  |
|----------------|------|-------------------------|
|nickname        |string|null: false              |
|email           |string|null: false, unique: true|
|password        |string|null: false              |
|family_name     |string|null: false              |
|last_name       |string|null: false              |
|family_name_kana|string|null: false              |
|last_name_kana  |string|null: false              |
|birthday        |string|null: false              |

## Association
has_many :items
has_one :buy
has_one :card

## items
|Column        |Type      |Options                        |
|--------------|----------|-------------------------------|
|item_name     |string    |null: false                    |
|image         |string    |null: false                    |
|price         |string    |null: false                    |
|description   |string    |null: false                    |
|condition     |string    |null: false                    |
|category      |string    |null: false                    |
|shopping_fee  |string    |null: false                    |
|prefecture    |string    |null: false                    |
|days          |string    |null: false                    |
|user          |references|null: false, foreign_key: true |

## Association
has_one :user

## card
|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|card_number    |string    |null: false                   |
|expiration_date|string    |null: false                   |
|security_code  |string    |null: false                   |
|user           |references|null: false, foreign_key: true|

## Association
belong_to :user
## buyer
|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|post_code     |string    |null: false                   |
|prefecture    |string    |null: false                   |
|city          |string    |null: false                   |
|address       |text      |null: false                   |
|building_name |text      |null: true                    |
|phone_number  |string    |null: false                   |
|user          |references|null: false, foreign_key: true|

## Association
belongs_to :user