require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入動画情報の保存' do
    context '購入動画情報の保存ができる場合' do
      it '全ての値だ正しく入力されてされていれば保存できる' do
        expect(@order).to be_valid
      end
    end
    
    context '購入動画情報の保存ができない場合' do
      it 'prefectureが空では保存できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'userが紐づいていないと保存できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('User must exist')
      end

      it 'profileが紐づいていないと保存できない' do
        @order.profile = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Profile must exist')
      end

      it 'videoが紐づいていないと保存できない' do
        @order.video = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Video must exist')
      end
    end
  end
end