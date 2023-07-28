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
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end

    it "nameが空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("商品名を入力してください")
    
    end
    it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("価格を入力してください")
    end
    it "infoが空だと登録できない" do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("商品説明を入力してください")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("カテゴリーは---以外を選択してください")
    end
    it "sales_status_idが空だと登録できない" do
      @item.sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("商品の状態は---以外を選択してください")
    end
    it "shipping_fee_status_idが空だと登録できない" do
      @item.shipping_fee_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("配送料の負担は---以外を選択してください")
    end
    it "prefecture_idが空だと登録できない" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("発送元の地域は---以外を選択してください")
    end
    it "scheduled_delivery_idが空だと登録できない" do
      @item.scheduled_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("発送までの日数は---以外を選択してください")
    end
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("商品画像を入力してください")
    end
    it "priceが300未満だと登録できない" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include ("価格は300以上の値にしてください")
    end
    it "priceが9,999,999以上だと登録できない" do
      @item.price = '19999999'
      @item.valid?
      expect(@item.errors.full_messages).to include ("価格は9999999以下の値にしてください")
    end
    it "priceが全角数値だと登録できない" do
      @item.price = '１２３'
      @item.valid?
      expect(@item.errors.full_messages).to include ("価格は数値で入力してください")
    end

    it "カテゴリーに「---」が選択されている場合は出品できない" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("カテゴリーは---以外を選択してください")
    end

    it "商品の状態に「---」が選択されている場合は出品できない" do
      @item.sales_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("商品の状態は---以外を選択してください")
    end

    it "配送料の負担に「---」が選択されている場合は出品できない" do
      @item.shipping_fee_status_id = '1'
       @item.valid?
      expect(@item.errors.full_messages).to include ("配送料の負担は---以外を選択してください")
    end

    it "発送元の地域に「---」が選択されている場合は出品できない" do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("発送元の地域は---以外を選択してください")
    end

    it "発送までの日数に「---」が選択されている場合は出品できない" do
      @item.scheduled_delivery_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("発送までの日数は---以外を選択してください")
    end


  end

end
