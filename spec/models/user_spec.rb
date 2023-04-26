require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation,first_name,last_name,first_name_kana,
      last_name_kana, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが半角英数混合であれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'Ａ12345'
        @user.password_confirmation = 'Ａ12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid') 
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
      it '姓（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'yama'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid") 
      end
      it '名（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank") 
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'hana'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid") 
      end
      it '姓（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名、漢字、英数字、記号）が含まれていると登録できない' do
        @user.first_name_kana = 'やま'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '名（カナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名、漢字、英数字、記号）が含まれていると登録できない' do
        @user.first_name_kana = 'はな'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid") 
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
