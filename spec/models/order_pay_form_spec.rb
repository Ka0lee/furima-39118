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
        expect(@order_pay_form.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号(postal_code)が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_pay_form.postal_code = '1234567'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '都道府県(prefecture)を選択していないと保存できないこと' do
        @order_pay_form.prefecture = 1
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("都道府県は---以外を選択してください")
      end
      it '市区町村(city)が空だと保存できないこと' do
        @order_pay_form.city = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地(address)が空だと保存できないこと' do
        @order_pay_form.address = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号(phone_number)が空だと保存できないこと' do
        @order_pay_form.phone_number = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号(phone_number)が10桁未満では保存できないこと' do
        @order_pay_form.phone_number = '100100100'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号(phone_number)が12桁を超過すると保存できないこと' do
        @order_pay_form.phone_number = '100001001001'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号(phone_number)が全角数字だと保存できないこと' do
        @order_pay_form.phone_number = '０９０１１１１１１１１'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('電話番号は不正な値です')
      end

      it "tokenが空では保存できないこと" do
        @order_pay_form.token = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("カード情報を入力してください")
      end

      it 'userが紐付いていない(未ログイン状態)と保存できないこと' do
        @order_pay_form.user_id = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Userを入力してください")
      end

      it "itemが紐付いていないと保存できないこと" do
        @order_pay_form.item_id = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Itemを入力してください")
      end
    
    end
  end
end
