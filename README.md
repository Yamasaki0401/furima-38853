# テー部設計

## usersテーブル
|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|family_name       |string|null: false              |
|last_name         |string|null: false              |
|family_name_kana  |string|null: false              |
|last_name_kana    |string|null: false              |
|birthday          |date  |null: false              |

### Association
has_many :items
has_many :orders


## items
|Column              |Type      |Options                        |
|--------------------|----------|-------------------------------|
|item_name           |string    |null: false                    |
|price               |integer   |null: false                    |
|description_id      |integer   |null: false                    |
|condition_id        |integer   |null: false                    |
|category_id         |integer   |null: false                    |
|shipping_fee_id     |integer   |null: false                    |
|shipping_schedule_id|integer   |null: false                    |
|prefecture_id       |integer   |null: false                    |
|user                |references|null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order

## addresses
|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|post_code     |string    |null: false                   |
|prefecture_id |integer   |null: false                   |
|city          |string    |null: false                   |
|address       |string    |null: false                   |
|building_name |string    |                              |
|phone_number  |string    |null: false                   |
|order         |references|null: false, foreign_key: true|

### Association
has_many :order

## orders
|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|item          |references|null: false, foreign_key: true|
|user          |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
belongs_to :address
