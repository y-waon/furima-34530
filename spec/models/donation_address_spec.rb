require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  before do
    @product_user = FactoryBot.create(:user)
    @buy_user =FactoryBot.create(:user)
    @product =FactoryBot.build(:product, user_id: @product_user.id)
    @product.save
    @buy = FactoryBot.build(:donation_address, user_id: @buy_user.id, product_id: @product.id)
    sleep 0.1
  end
  describe "住所入力" do
    context '新規出品できるとき' do
      it "一連の登録" do
        expect(@buy).to be_valid
      end
    end
    context '新規出品できない時' do
      it "郵便番号が必須" do
        @buy.post_number = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Post number can't be blank")
      end
      it "郵便番号の保存にはハイフンが必要であること"do
        @buy.post_number = '0000000'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Post number is invalid. Include hyphen(-)") 
      end
      it "都道府県が必須" do
        @buy.area_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Area is not a number") 
      end
      it "都道府県が必須(1代入)" do
        @buy.area_id = '1'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Area must be other than 1") 
      end
      it "市区町村が必須" do
        @buy.municipalities = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "番地が必須" do
        @buy.house_number = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が必須" do
        @buy.phone_number = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は11桁以内の数値のみ保存可能なこと" do
        @buy.phone_number = '000000000000'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "トークンが空だと登録できない" do
        @buy.token = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空だと登録できない" do
        @buy.user_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end
      it "product_idが空だと登録できない" do
        @buy.product_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
