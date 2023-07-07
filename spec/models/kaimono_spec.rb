require 'rails_helper'

RSpec.describe Kaimono, type: :model do
  before do
    @kaimono = FactoryBot.build(:kaimono)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'tokenと郵便番号と都道府県と市町村と番地と電話番号とuser_id,item_idが存在すれば登録できる' do
        expect(@kaimono).to be_valid
      end
    end
    context '商品購入できないとき' do
      it '郵便番号が空では登録できない' do
        @kaimono.postal_code = ''
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("Postal code can't be blank")
      end
    
      it '郵便番号が正しい形式でなければ登録できない' do
        @kaimono.postal_code = '1234567'
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
    
      it '都道府県が空では登録できない' do
        @kaimono.region_id = ''
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("Region can't be blank")
      end
    
      it '市町村が空では登録できない' do
        @kaimono.city = ''
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("City can't be blank")
      end
    
      it '番地が空では登録できない' do
        @kaimono.house_number = ''
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("House number can't be blank")
      end
    
      it '電話番号が空では登録できない' do
        @kaimono.phone_number = ''
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("Phone number can't be blank")
      end
    
      it '電話番号が10桁以上11桁以内でなければ登録できない' do
        @kaimono.phone_number = '123456789'
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("Phone number is invalid. Phone number should be 10 to 11 digits.")
      end

      it "tokenが空では登録できないこと" do
        @kaimono.token = nil
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("Token can't be blank")
      end
    end    
  end
end
