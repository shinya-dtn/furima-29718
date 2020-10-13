require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '購入情報の保存' do
    context '購入情報が保存できる時' do
      it 'token,zip_code,area_id,city,street_number,phone_number全てあれば保存できる' do
        expect(@purchase).to be_valid
      end
      it 'zip_codeに、-があると保存できる' do
        @purchase.zip_code = "111-1111"
        expect(@purchase).to be_valid
      end
      it 'phone_numberが11桁だと保存できる' do
        @purchase.phone_number = "00000000000"
        expect(@purchase).to be_valid
      end
    end

    context '購入情報が保存できない時' do
      it 'tokenが空だと保存できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'zip_codeが空だと保存できない' do
        @purchase.zip_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeに、-がないと保存できない' do
        @purchase.zip_code = '1111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Zip code is invalid")
      end
      it 'area_idが0だと保存できない' do
        @purchase.area_id = '0'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area must be other than 0")
      end
      it 'cityが空だと保存できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと保存できない' do
        @purchase.street_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @purchase.phone_number = '000000000000'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end