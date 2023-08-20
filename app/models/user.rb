class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :order

  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 's invalid. Include both letters and numbers' }
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :date_of_birth, presence: true

  with_options presence: true,
               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                         message: 'is invalid. Input full-width characters' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true,
               format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/,
                         message: 'is invalid. Input full-width katakana characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end
end
