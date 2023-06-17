class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :nickname,presence:true
        
         #漢字制約
        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
          validates :first_name
          validates :last_name
        end

        #カタカナ制約
        with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
         validates :last_name_kana
         validates :first_name_kana
        end

         validates :birth_date,presence:true

        #@制約
        with_options puniqueness: true, format: { with: /\A[\w+-.]+@[a-z\d-]+\z/i } do
         validates :email
        end



end
