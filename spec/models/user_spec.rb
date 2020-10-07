require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kとlast_name_k、birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字6文字以上であれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが５文字以下なら登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_kが空だと登録できない' do
        @user.first_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k can't be blank")
      end
      it 'first_name_kが半角だと登録できない' do
        @user.first_name_k = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name k is invalid')
      end
      it 'first_name_kが漢字だと登録できない' do
        @user.first_name_k = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name k is invalid')
      end
      it 'first_name_kがひらがなだと登録できない' do
        @user.first_name_k = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name k is invalid')
      end
      it 'first_name_kが英語だと登録できない' do
        @user.first_name_k = 'AA'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name k is invalid')
      end
      it 'last_name_kが空だと登録できない' do
        @user.last_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k can't be blank")
      end
      it 'last_name_kが半角だと登録できない' do
        @user.last_name_k = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name k is invalid')
      end
      it 'last_name_kが漢字だと登録できない' do
        @user.last_name_k = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name k is invalid')
      end
      it 'last_name_kがひらがなだと登録できない' do
        @user.last_name_k = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name k is invalid')
      end
      it 'last_name_kが英語だと登録できない' do
        @user.last_name_k = 'AA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name k is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
