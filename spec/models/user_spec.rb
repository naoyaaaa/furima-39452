require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmationと名前と生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
    end
  end
end

# ユーザー新規登録のテストで、必要な属性（nickname、email、password、password_confirmation）が存在する場合に登録できることを確認するテストが失敗しています。テスト結果によると、生年月日（birthdate）、名字（family_name）、名前（first_name）、名字のフリガナ（family_name_pron）、名前のフリガナ（first_name_pron）の値が存在しないためにエラーが発生しています。

# ユーザーモデルのバリデーションを確認し、生年月日、名字、名前、名字のフリガナ、名前のフリガナのバリデーションルールを追加します。これにより、全角の値が必要であることが確実になります。

# ユーザー新規登録のテストで、重複したメールアドレスが存在する場合に登録できないことを確認するテストが失敗しています。テスト結果によると、他のユーザー（another_user）がエラーを返しているため、重複したメールアドレスが存在するというエラーメッセージが期待されています。

# これらのエラーを解決するためには、次の手順を考慮することが重要です。

# ユーザーモデルに一意性のバリデーションを追加し、メールアドレスの重複を防ぐことができます。
