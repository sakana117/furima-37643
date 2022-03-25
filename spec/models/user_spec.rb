require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    #テスト総数：21個
    context '新規登録できるとき' do
      #新規登録できるとき：1個
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      #新規登録できないとき：20個
      #新規登録できないとき：nickname関連：1個
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      #新規登録できないとき：＊_name関連：8個
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_nameが全角以外では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが全角以外では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'last_name_kanaがカナ以外では登録できない' do
        @user.last_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'first_name_kanaがカナ以外では登録できない' do
        @user.last_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      #新規登録できないとき：birth_date関連：1個            
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      #新規登録できないとき：email関連：3個      
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emaiは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      #新規登録できないとき：password関連：6個
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')    
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password =  '1a' + Faker::Internet.password(min_length: 127)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it 'passwordに英字が存在しない場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')    
      end

      it 'passwordが数字が存在しない場合は登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')    
      end

      it '全角文字を含むパスワードは登録できない' do
        @user.password = 'アイウエオか'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')    
      end
    end
  end
end
