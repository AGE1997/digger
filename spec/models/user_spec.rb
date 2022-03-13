require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'email、telephone_number、password、password_confirmation、last_name、first_name、
      pseudonym_last_name、pseudonym_first_name、が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
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

      it 'pseudonym_last_nameが空では登録できない' do
        @user.pseudonym_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Pseudonym last name can't be blank")
      end

      it 'pseudonym_first_nameが空では登録できない' do
        @user.pseudonym_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Pseudonym first name can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'testemail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'telephone_numberが空では保存できない' do
        @user.telephone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが10桁未満だと保存できない' do
        @user.telephone_number = 123_456_789
        @user.valid?
        expect(@user.errors.full_messages).to include('Telephone number is invalid. 電話番号は10桁 or 11桁')
      end

      it 'telephone_numberが11桁以上だと保存できない' do
        @user.telephone_number = 123_456_789_012
        @user.valid?
        expect(@user.errors.full_messages).to include('Telephone number is invalid. 電話番号は10桁 or 11桁')
      end

      it 'telephone_numberが半角数値でないと保存できない' do
        @user.telephone_number = '１２３４５６７８９０'
        @user.valid?
        expect(@user.errors.full_messages).to include('Telephone number is invalid. 電話番号は10桁 or 11桁')
      end

      it '重複したtelephone_numberが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, telephone_number: @user.telephone_number)
        another_user.telephone_number = @user.telephone_number
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Telephone number has already been taken')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でなければ登録できない(英字のみ)' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end

      it 'passwordが半角英数字混合でなければ登録できない(数字のみ)' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end

      it 'passwordが半角でなければ登録できない' do
        @user.password = 'ＡＢＣ123'
        @user.password_confirmation = 'ＡＢＣ123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end

      it 'last_nameが全角文字でなければ登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
      end

      it 'first_nameが全角文字でなければ登録できない' do
        @user.first_name = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
      end

      it 'pseudonym_last_nameが全角カタカナでなければ登録できない' do
        @user.pseudonym_last_name = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Pseudonym last name には全角カタカナを使用してください')
      end

      it 'pseudonym_first_nameが全角カタカナでなければ登録できない' do
        @user.pseudonym_first_name = 'ｱｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Pseudonym first name には全角カタカナを使用してください')
      end
    end
  end
end
