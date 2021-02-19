class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname,       presence: true
    validates :birthday,       presence: true
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_katakana
    validates :last_katakana
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze 
  validates :password, format: { with: PASSWORD_REGEX }
end
