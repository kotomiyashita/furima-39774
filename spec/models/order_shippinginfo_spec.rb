require 'rails_helper'

RSpec.describe OrderShippinginfo, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @order_shippinginfo = FactoryBot.build(:order_shippinginfo, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shippinginfo).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shippinginfo.building = ''
        expect(@order_shippinginfo).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では購入できないこと' do
        @order_shippinginfo.token = ''
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_shippinginfo.postal_code = ''
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shippinginfo.postal_code = '1234567'
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_shippinginfo.prefecture_id = 1
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_shippinginfo.city = ''
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_shippinginfo.address = ''
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shippinginfo.phone_number = ''
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが文字列だと保存できないこと' do
        @order_shippinginfo.phone_number = 'abcdefghij'
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが全角だと保存できないこと' do
        @order_shippinginfo.phone_number = '１２３４５６７８９０'
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @order_shippinginfo.phone_number = '123456789'
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_shippinginfo.phone_number = '123456789012'
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shippinginfo.user_id = nil
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shippinginfo.item_id = nil
        @order_shippinginfo.valid?
        expect(@order_shippinginfo.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
