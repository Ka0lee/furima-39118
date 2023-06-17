class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :nickname,presence:true
         
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
          validates :first_name
          validates :last_name
        end

         validates :last_name_kana,presence:true
         validates :first_name_kana,presence:true
         validates :birth_date,presence:true
         validates :email, uniqueness: true



end
