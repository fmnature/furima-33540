require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品投稿機能のテスト" do
    it "image, title, text, category_id, state_id, area_id, priceが空だと保存できない" do
      expect(@item).to be_valid
    end
    it "imageが空だと保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "titleが空だと保存できない" do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "textが空だと保存できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it "category_id=1だと保存できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "state_id=1だと保存できない" do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end
    it "area_id=1だと保存できない" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it "priceが空だと保存できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 入力値が300~9999999の範囲外です")
    end
    it "priceが300円より低いと保存できない" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 入力値が300~9999999の範囲外です")
    end
    it "priceが9999999円より高いと保存できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 入力値が300~9999999の範囲外です")
    end
    it "priceは文字列だと保存できない" do
      @item.price = "aaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 入力値が300~9999999の範囲外です")
    end
  end
end
