class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true

  # 漢字制約
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください'} do
    validates :first_name
    validates :last_name
  end

  # カタカナ制約
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角文字を使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birth_date, presence: true

  # password英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英数字の両方を含めて設定してください'
end
