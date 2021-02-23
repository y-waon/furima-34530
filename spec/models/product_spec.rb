require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe "新規出品" do
    context '新規出品できるとき' do
      it "一連の登録" do
        expect(@product).to be_valid
      end
    end
    context '新規出品できない時' do
      it '商品画像を1枚つけることが必須であること' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が必須であること' do
        @product.text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態についての情報が必須であること' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status is not a number")
      end
      it '配送料の負担についての情報が必須であること' do
        @product.burden_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Burden is not a number")
      end
      it '発送元の地域についての情報が必須であること' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area is not a number")
      end
      it '発送までの日数についての情報が必須であること' do
        @product.guideline_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Guideline is not a number")
      end
      it '販売価格についての情報が必須であること' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、¥300以下だと保存不可能であること' do
        @product.price = '200'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格は、¥19999999以上だと保存不可能であること' do
        @product.price = '19999999'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格は全角数字のみ保存不能であること' do
        @product.price = '１４３４'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格は全角数字のみ保存不能であること' do
        @product.price = 'aisjd'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
