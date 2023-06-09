require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品登録ができる' do
      it 'imageとitem_name,price,description,condition_id,category_id,shipping_fee_id,shipping_schedule_id,prefectureを登録できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数値であれば登録できる' do
        expect(@item).to be_valid
      end

      it 'priceが300~9999999だと登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない' do
      it 'imageが空だと登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank", 'Images is too short (minimum is 1 character)')
      end

      it 'imageは6枚以上登録できない' do
        @item.images = [fixture_file_upload('public/images/test_image.jpg', 'test_image.jpg'),
                        fixture_file_upload('public/images/test_image2.jpg', 'test_image2.jpg'),
                        fixture_file_upload('public/images/test_image3.jpg', 'test_image3.jpg'),
                        fixture_file_upload('public/images/test_image4.jpg', 'test_image4.jpg'),
                        fixture_file_upload('public/images/test_image5.jpg', 'test_image5.jpg'),
                        fixture_file_upload('public/images/test_image6.jpg', 'test_image6.jpg')]
        @item.valid?
        expect(@item.errors.full_messages).to include('Images is too long (maximum is 5 characters)')
      end

      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'condition_idが空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_idが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'shippinge_fee_idが1だと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'shipping_fee__idが空だと登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'shipping_schedule_idが1だと登録できない' do
        @item.shipping_schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping schedule can't be blank")
      end

      it 'shipping_schedule_idが空だと登録できない' do
        @item.shipping_schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping schedule can't be blank")
      end

      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'priceが299以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10000000以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが半角数値でない場合登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
