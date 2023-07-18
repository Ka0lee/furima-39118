require 'rails_helper'

RSpec.describe OrderPayForm, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_pay_form = FactoryBot.build(:order_pay_form, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_pay_form).to be_valid
      end

      it '建物名(building)は空でも保存できること' do
        @order_pay_form.building = ''
        expect(@order_pay_form).to be_valid
      end

      
    end

    context '内容に問題がある場合' do
      it '郵便番号(postal_code)が空だと保存できないこと' do
        @order_pay_form.postal_code = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号(postal_code)が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_pay_form.postal_code = '1234567'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県(prefecture)を選択していないと保存できないこと' do
        @order_pay_form.prefecture = 0
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村(city)が空だと保存できないこと' do
        @order_pay_form.city = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地(address)が空だと保存できないこと' do
        @order_pay_form.address = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号(phone_number)が10桁未満では保存できないこと' do
        @order_pay_form.phone_number = '100100100'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号(phone_number)が12桁を超過すると保存できないこと' do
        @order_pay_form.phone_number = '100001001001'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号(phone_number)が全角数字だと保存できないこと' do
        @order_pay_form.phone_number = '０９０１１１１１１１１'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('Phone number is invalid')
      end

      it "tokenが空では保存できないこと" do
        @order_pay_form.token = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_pay_form.user_id = nil
        binding.pry
        @order_pay_form.valid?
        expect(@order_pay_form.user_id.errors.full_messages).to include("User can't be blank")
      end

      it "売却済みのitemは保存できないこと" do
        @order_pay_form.item_id != nil
        @order_pay_form.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "未ログインユーザーは商品の保存ができない" do
        @order_pay_form.user_id.signed_in?
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Token can't be blank")
      end
    
    end
  end
end
