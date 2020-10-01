class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validats :nickname
    validats :first_name, :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validats :first_name_k, :last_name_k, format: {with: /\A[ァ-ン]+\z/}
    validats :birthday, 
  end
end
