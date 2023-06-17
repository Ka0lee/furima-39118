require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録/ユーザー情報' do

    it 'nickname,email、password,password_confirmation,first_name,last_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる' do
  end

  it 'nicknameが空では登録できない' do
  end

  it 'emailが空では登録できない' do
  end

  it 'passwordが空では登録できない' do
  end

  it '重複したemailが存在する場合は登録できない' do
  end

  it 'emailは@を含まないと登録できない' do
  end

  it 'passwordが5文字以下では登録できない' do
  end

  it 'passwordが129文字以上では登録できない' do
  end

  it 'passwordが数字だけでは登録できない' do
  end

  it 'passwordがローマ字だけでは登録できない' do
  end

  it 'passwordが全角では登録できない' do
  end

  it 'passwordとpassword_confirmationが不一致では登録できない' do
  end

  it 'last_nameが空では登録できない' do
  end

  it 'first_nameが空では登録できない' do
  end

  it 'last_name_kanaが空では登録できない' do
  end
  
  it 'first_name_kanaが空では登録できない' do
  end
  
  it 'birth_dateが空では登録できない' do
  end
  
end



