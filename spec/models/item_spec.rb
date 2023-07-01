require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  context '出品投稿がうまくいくとき' do
    it "nameとprice、infoとcategory_id、sales_status_id、shipping_fee_status_id、prefecture_id、scheduled_delivery_id、imageが存在すれば登録できる" do
      expect(@item).to be_valid
    end

  end

  context '出品投稿がうまくいかないとき' do
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it "nameが空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Name can't be blank")
    
    end
    it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price can't be blank")
    end
    it "infoが空だと登録できない" do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Info can't be blank")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
    end
    it "sales_status_idが空だと登録できない" do
      @item.sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Sales status can't be blank")
    end
    it "shipping_fee_status_idが空だと登録できない" do
      @item.shipping_fee_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Shipping fee status can't be blank")
    end
    it "prefecture_idが空だと登録できない" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
    end
    it "scheduled_delivery_idが空だと登録できない" do
      @item.scheduled_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Scheduled delivery can't be blank")
    end
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
    end
    it "priceが300未満だと登録できない" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
    end
    it "priceが9,999,999以上だと登録できない" do
      @item.price = '19999999'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
    end
    it "priceが全角数値だと登録できない" do
      @item.price = '１２３'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is not a number")
    end

    it "カテゴリーに「---」が選択されている場合は出品できない" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
    end

    it "商品の状態に「---」が選択されている場合は出品できない" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
    end

    it "配送料の負担に「---」が選択されている場合は出品できない" do
      @item.sales_status_id = '1'
       @item.valid?
      expect(@item.errors.full_messages).to include ("Sales status can't be blank")
    end

    it "発送元の地域に「---」が選択されている場合は出品できない" do
      @item.shipping_fee_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Shipping fee status can't be blank")
    end

    it "発送までの日数に「---」が選択されている場合は出品できない" do
      @item.scheduled_delivery_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Scheduled delivery can't be blank")
    end


  end

end
