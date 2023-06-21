require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
    puts @item.inspect
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '画像、商品名、説明、カテゴリー、状態、負担、日数、地域、価格があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'カテゴリーが未選択だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が未選択だと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が未選択だと出品できない' do
        @item.cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end

      it '発送元の地域が未選択だと出品できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it '発送までの日数が未選択だと出品できない' do
        @item.howmanydays_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Howmanydays can't be blank")
      end

      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が299以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が10000000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
