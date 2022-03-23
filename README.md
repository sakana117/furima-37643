## usersテーブル
| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| nickname            | string     | null: false                    |
| last-name           | string     | null: false                    |
| first-name          | string     | null: false                    |
| last-name-kana      | string     | null: false                    |
| first-name-kana     | string     | null: false                    |
| birth-date          | date       | null: false                    |

### Association
- has_many :items
- has_many :orders


## itemsテーブル
| Column                      | Type       | Options                              |
| ----------------------------| ---------- | -------------------------------------|
| item-name                   | string     | null: false                          |
| item-info                   | text       | null: false                          |
| item-category_id            | integer    | null: false                          |
| item-sales-status_id        | integer    | null: false                          |
| item-shipping-fee-status_id | integer    | null: false                          |
| item-prefecture_id          | integer    | null: false                          |
| item-scheduled-delivery_id  | integer    | null: false                          |
| item-price                  | integer    | null: false                          |
| user                        | references | null: false, foreign_key:true        |
| ※item-image                 |            |                                      |

### Association
- belongs_to :user
- has_many :orders


## ordersテーブル
| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| item                | references | null: false, foreign_key:true  |
| user                | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address

## addressesテーブル
| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| postal-code         | string     | null: false                    |
| prefecture          | string     | null: false                    |
| city                | string     | null: false                    |
| addresses           | string     | null: false                    |
| building            | string     |                                |
| phone-number        | string     | null: false                    |

### Association
- belongs_to :order