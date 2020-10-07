require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/files/camera.png')
  end

  describe '商品の保存' do
    context '商品が保存できるとき' do
      it 'image,prodact_name,comment,category_id,status_id,burden_id,area_id,day_id,money,user_idが全てあると保存できる' do
        expect(@item).to be_valid
      end
      it 'moneyが300以上だと保存できる' do
        @item.money = '300'
        expect(@item).to be_valid
      end
      it 'moneyが9999999以下だと保存できる' do
        @item.money = '9999999'
        expect(@item).to be_valid
      end
      it 'moneyが半角数字だと保存できる' do
        @item.money = '300'
        expect(@item).to be_valid
      end
    end

    context '商品が保存できないとき' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'prodact_nameが空だと保存できない' do
        @item.prodact_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prodact name can't be blank")
      end
      it 'commentが空だと保存できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it 'category_idが0だと保存できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'status_idが0だと保存できない' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it 'burden_idが0だと保存できいない' do
        @item.burden_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 0')
      end
      it 'area_idが0だと保存できない' do
        @item.area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 0')
      end
      it 'day_idが0だと保存できない' do
        @item.day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 0')
      end
      it 'moneyが空だと保存できない' do
        @item.money = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Money can't be blank")
      end
      it 'moneyが299円以下だと保存できない' do
        @item.money = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Money must be greater than or equal to 300')
      end
      it 'moneyが10,000,000以上だと保存できない' do
        @item.money = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Money must be less than or equal to 9999999")
      end
      it 'moneyが全角数字だと保存できない' do
        @item.money = '０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Money is not a number')
      end
      it 'user_idが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
