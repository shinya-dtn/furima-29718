# テーブル設
##users テーブ
｜ Columu                | Type            | Options       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _  | 
｜ nickname              | string          | nall: false   |
｜ email                 | string          | nall: false   |
｜ password              | string          | nall: false   |
｜ first_name            | string          | null: false   |
｜ last_name             | string          | null: false   |
｜ first_name_k          | string          | null: false   |
｜ last_name_k           | string          | null: false   |
｜ birhday               | date            | null: false   |

### Association

has_many :items
has_one :purchase

##items テーブル
｜ Columu                | Type            | Options          |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ | 
｜ prodact_name          | string          | nall: false      |
｜ comment               | text            | nall: false      |
｜ category_id           | integer         | nall: false      |
｜ status_id             | integer         | null: false      |
｜ burden_id             | integer         | null: false      |
｜ area_id               | integer         | null: false      |
｜ days_id               | datetime        | null: false      |
｜ money                 | integer         | null: false      |
｜ user_id               | integer         | foregin_key: true|

### Association

belongs_to :user
has_many :purchases

##address テーブル
｜ Columu                | Type            | Options          |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ |
｜ zip_code              | string          | nall: false      |
｜ prefectures           | string          | nall: false      |
｜ cities                | string          | nall: false      |
｜ street_number         | string          | nall: false      |
｜ billding_name         | string          |                  |
｜ phone_number          | string          | null: false      |
｜ purchase_id           | integer         | foregin_key: true|

### Association

belonds_to :purchase
belongs_to :item

## purchases テーブル
｜ Columu                | Type            | Options          |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ | 
｜ user_id               | inreger         | foregin_key: true|
｜ item_id               | integer         | foregin_key: true|

### Association
belongs_to :user
belongs_to :item
has_many :addresss