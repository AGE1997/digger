class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :telephone_number, uniqueness: { case_sensitive: true },
                                 format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. 電話番号は10桁 or 11桁' }
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'には全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ンー－]+\z/, message: 'には全角カタカナを使用してください' } do
    validates :pseudonym_last_name
    validates :pseudonym_first_name
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }

  has_one :profile
  has_many :videos
  has_many :orders
  has_many :comments, dependent: :destroy
end
