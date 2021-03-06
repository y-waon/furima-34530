require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "新規登録/ユーザー情報" do
    context '新規登録できるとき' do
      it "一連の登録" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
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
      it "emailに@を含める必要があるということ" do
        @user.email = "email.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
        @user.password = '000000'
        @user.password_confirmation = '010100'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが6文字以上の入力が必要だということ" do
        @user.password = '0a000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは、確認用を含めて2回入力すること" do
        @user.password = '0a0000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードは、半角英語のみでは登録できないこと" do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードは、半角数字のみでは登録できないこと" do
        @user.password = '0000000'
        @user.password_confirmation = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードは、全角英数混合では登録できないこと" do
        @user.password = 'AAAA１１'
        @user.password_confirmation = 'AAAA１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "ユーザー本名は、名字が必須であること" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名は、名前が必須であること" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー本名(苗字)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ユーザー本名(名前)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "ユーザー本名のフリガナは、名字が必須であること" do
        @user.first_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First katakana can't be blank")
      end
      it "ユーザー名前のフリガナは、名字が必須であること" do
        @user.last_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last katakana can't be blank")
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.first_katakana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First katakana is invalid")
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.last_katakana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last katakana is invalid")
      end
      it "生年月日が必須であること" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
