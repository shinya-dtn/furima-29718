# テーブル設計

##users テーブ
｜ Columu                | Type            | Options       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _  | 
｜ nickname              | string          | null: false   |
｜ email                 | string          | null: false   |
｜ password              | string          | null: false   |
｜ first_name            | string          | null: false   |
｜ last_name             | string          | null: false   |
｜ first_name_k          | string          | null: false   |
｜ last_name_k           | string          | null: false   |
｜ birthday              | date            | null: false   |

### Association

has_many :items
has_many :purchases

##items テーブル
｜ Columu                | Type            | Options                       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _  | 
｜ prodact_name          | string          | null: false                   |
｜ comment               | text            | null: false                   |
｜ category_id           | integer         | null: false                   |
｜ status_id             | integer         | null: false                   |
｜ burden_id             | integer         | null: false                   |
｜ area_id               | integer         | null: false                   |
｜ days_id               | integer         | null: false                   |
｜ money                 | integer         | null: false                   |
｜ user_id               | integer         | null: false, foregin_key: true|

### Association

belongs_to :user
has_one :purchase

##addresses テーブル
｜ Columu                | Type            | Options                       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _  |
｜ zip_code              | string          | null: false                   |
｜ prefectures_id        | integer         | null: false                   |
｜ cities                | string          | null: false                   |
｜ street_number         | string          | null: false                   |
｜ billding_name         | string          |                               |
｜ phone_number          | string          | null: false                   |
｜ purchase_id           | integer         | null: false, foregin_key: true|

### Association

belonds_to :purchase

## purchases テーブル
｜ Columu                | Type            | Options                       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _| 
｜ user_id               | integer         | null: false, foregin_key: true|
｜ item_id               | integer         | null: false, foregin_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address