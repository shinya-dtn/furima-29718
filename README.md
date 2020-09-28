# テーブル設
##users テーブ
｜ Columu                | Type            | Options       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _  | 
｜ nickname              | string          | nall: false   |
｜ email                 | string          | nall: false   |
｜ password              | integer         | nall: false   |
｜ password_confirmation | integer         | nall: false   |
｜ first_name            | string          | null: false   |
｜ last_name             | string          | null: false   |
｜ first_name_k          | string          | null: false   |
｜ last_name_k           | string          | null: false   |
｜ birhday               | integer         | null: false   |

### Association

has_many :items
has_one :address
has_one :purchase

##items テーブル
｜ Columu                | Type            | Options       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _  | 
｜ image                 | text            | nall: false   |
｜ prodact_name          | string          | nall: false   |
｜ comment               | text            | nall: false   |
｜ category              | string          | nall: false   |
｜ status                | string          | null: false   |
｜ burden                | string          | null: false   |
｜ area                  | string          | null: false   |
｜ days                  | datetime        | null: false   |
｜ money                 | integer         | null: false   |
｜ user_id               | integer         |               |

### Association

belongs_to :user
belongs_to :purchase

##address テーブル
｜ Columu                | Type            | Options       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _  |
｜ zip_code              | inreger         | nall: false   |
｜ prefectures           | string          | nall: false   |
｜ cities                | string          | nall: false   |
｜ street_number         | integer         | nall: false   |
｜ billding_name         | string          |               |
｜ phone_number          | integer         | null: false   |
｜ user_id               | integer         | null: false   |

### Association

belongs_to :user
belongs_to :item

## purchases テーブル
｜ Columu                | Type            | Options       |
｜_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _  | 
｜ user_id               | inreger         |               |
｜ item_id               | integer         |               |

### Association
belongs_to :user
belongs_to :user