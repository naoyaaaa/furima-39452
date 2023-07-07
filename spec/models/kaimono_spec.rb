require 'rails_helper'

RSpec.describe Kaimono, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @kaimono = FactoryBot.build(:kaimono, user_id: user.id, item_id: item.id)
    sleep(1)
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
        expect(@kaimono.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
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
        expect(@kaimono.errors.full_messages).to include('Phone number is invalid. Phone number should be 10 to 11 digits.')
      end

      it 'tokenが空では登録できないこと' do
        @kaimono.token = nil
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("Token can't be blank")
      end

      it '電話番号が12桁以上では登録できない' do
        @kaimono.phone_number = '123456789012'
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include('Phone number is invalid. Phone number should be 10 to 11 digits.')
      end

      it '電話番号に半角数字以外が含まれている場合は登録できない' do
        @kaimono.phone_number = '1234abcd56'
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include('Phone number is invalid. Phone number should be 10 to 11 digits.')
      end

      it 'userが紐付いていなければ登録できない' do
        @kaimono.user_id = nil
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ登録できない' do
        @kaimono.item_id = nil
        @kaimono.valid?
        expect(@kaimono.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
