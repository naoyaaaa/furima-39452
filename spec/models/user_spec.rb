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



        it"ニックネームが空では登録できない"do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
        end

        it"英字のみのパスワードでは登録できない"do
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must contain at least one letter and one digit, and be at least 6 characters long")
        end

        it"数字のみのパスワードでは登録できない"do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must contain at least one letter and one digit, and be at least 6 characters long")
        end

        it"全角文字を含むパスワードでは登録できない"do
        @user.password = "パスワード123"
        @user.password_confirmation = "パスワード123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must contain at least one letter and one digit, and be at least 6 characters long")
        end

        it"姓（全角）が空だと登録できない"do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name can't be blank")
        end

        it"姓（全角）に半角文字が含まれていると登録できない"do
        @user.family_name = "Smith"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name は全角（漢字・ひらがな・カタカナ）で入力してください")  
        end

        it "名（全角）が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name は全角（漢字・ひらがな・カタカナ）で入力してください")
        end

        it "名（全角）に半角文字が含まれていると登録できない" do
        @user.first_name = "John"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角（漢字・ひらがな・カタカナ）で入力してください")
        end

        it"姓（カナ）が空だと登録できない"do
        @user.family_name_pron = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name pron can't be blank")
        end

        it"姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない"do
        @user.family_name_pron = "佐藤"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name pron は全角（カタカナ）で入力してください")
        end

        it"名（カナ）が空だと登録できない"do
        @user.first_name_pron = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name pron は全角（カタカナ）で入力してください")
        end

        it"名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない"do
        @user.first_name_pron = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name pron は全角（カタカナ）で入力してください")

        end

        it"生年月日が空だと登録できない"do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthdate can't be blank")
        end


 
  end
 end
end
  pending "add some examples to (or delete) #{__FILE__}"
end