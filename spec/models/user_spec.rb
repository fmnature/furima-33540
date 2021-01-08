require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "新規登録/ユーザー情報" do
    context "新規登録がうまくいくとき" do
      it "name , email, password, password_confirmation, first_name_z, clast_name_z, first_name_k, last_name_k, birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "@を含まないemailだと登録できない" do
        @user.email = "aaaaaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "aaa12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "aaaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    describe "新規登録/本人情報確認" do
      it "first_name_zが空だと登録できない" do
        @user.first_name_z = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name z can't be blank")
      end
      it "first_name_zが漢字でないと登録できない" do
        @user.first_name_z = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name z 全角文字を使用してください")
      end
      it "last_name_zが空だと登録できない" do
        @user.last_name_z = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name z can't be blank")
      end
      it "last_name_zが漢字でないと登録できない" do
        @user.last_name_z = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name z 全角文字を使用してください")
      end
      it "first_name_kが空だと登録できない" do
        @user.first_name_k = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k can't be blank")
      end
      it "first_name_kがカタカナでないと登録できない" do
        @user.first_name_k = "ああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k カタカナを使用してください")
      end
      it "last_name_kが空だと登録できない" do
        @user.last_name_k = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k can't be blank")
      end
      it "last_name_kがカタカナでないと登録できない" do
        @user.last_name_k = "ああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k カタカナを使用してください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    describe "トップページ" do
    end
  end
end
