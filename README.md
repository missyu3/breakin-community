# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |

### Association
- has_many :places
- has_many :users_places
- has_many :comments

## places テーブル
| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| image               | string | null: false |
| name                | string | null: false |
| address             | string | null: false |
| main_time           | time | null: false |
| available_time      | time | null: false |
| price               | integer | null: false |

### Association
- has_many :users
- has_many :users_places
- has_many :comments

## user_places テーブル
| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| user         | references | null: false, foreign_key: true |
| place         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :place

## commentsテーブル
| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| text             | text | null: false |
| user_id          | integer | null: false, foreign_key: true |
| place_id         | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :place