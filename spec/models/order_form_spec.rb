require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe "商品購入機能のテスト" do
    before do
      @order_form = FactoryBot.build(:order_form)
    end
    it "全ての値が正しく入力されていれば保存できる" do
      expect(@order_form).to be_valid
    end
    it "build_nameが空でも登録できる" do
      @order_form.build_name = nil
      expect(@order_form).to be_valid
    end
    it "tokenが空だと登録できない" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it "post_numが空だと登録できない" do
      @order_form.post_num = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post num can't be blank")
    end
    it "post_numにハイフンがないと登録できない" do
      @order_form.post_num = "22222222"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post num is invalid")
    end
    it "post_numは文字列だと登録できない" do
      @order_form.post_num = "aaaaa"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post num is invalid")
    end
    it "post_numは全角文字だと登録できない" do
      @order_form.post_num = "LL"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post num is invalid")
    end
    it "post_numは半角英数混合だと登録できない" do
      @order_form.post_num = "aaa123"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post num is invalid")
    end
    it "area_idが空だと登録できない" do
      @order_form.area_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Area can't be blank")
    end
    it "area_idが1だと登録できない" do
      @order_form.area_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Area must be other than 1")
    end
    it "municipalが空だと登録できない" do
      @order_form.municipal = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Municipal can't be blank")
    end
    it "addressが空だと登録できない" do
      @order_form.address = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numが空だと登録できない" do
      @order_form.phone_num = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone num can't be blank")
    end
    it "phone_numは10桁より低いと登録できない" do
      @order_form.phone_num = "999999"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone num is invalid")
    end
    it "phone_numは11桁より高いと登録できない" do
      @order_form.phone_num = "999999999999"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone num is invalid")
    end
    it "phone_numは文字列だと登録できない" do
      @order_form.phone_num = "aaaa"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone num is invalid")
    end
    it "phone_numは全角文字だと登録できない" do
      @order_form.phone_num = "XX"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone num is invalid")
    end
    it "phone_numは半角英数混合だと登録できない" do
      @order_form.phone_num = "aaa123"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone num is invalid")
    end
  end
end