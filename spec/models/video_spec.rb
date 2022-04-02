require 'rails_helper'

RSpec.describe Video, type: :model do
  before do
    @video = FactoryBot.build(:video)
  end

  describe '動画投稿' do
    context '動画投稿できる場合' do
      it 'video、title、introduction、genre、prefecture、priceが存在すれば登録できる' do
        expect(@video).to be_valid
      end
    end
    context '動画投稿できない場合' do
      it 'videoが空では保存できない' do
        @video.video = nil
        @video.valid?
        expect(@video.errors.full_messages).to include("Video can't be blank")
      end
      it 'titleが空では保存できない' do
        @video.title = ''
        @video.valid?
        expect(@video.errors.full_messages).to include("Title can't be blank")
      end
      it 'introductionが空では保存できない' do
        @video.introduction = ''
        @video.valid?
        expect(@video.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'genreが空では保存できない' do
        @video.genre_id = 1
        @video.valid?
        expect(@video.errors.full_messages).to include("Genre can't be blank")
      end
      it 'prefectureが空では保存できない' do
        @video.prefecture_id = 1
        @video.valid?
        expect(@video.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'priceが空では保存できない' do
        @video.price = ''
        @video.valid?
        expect(@video.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは100未満だと保存できない' do
        @video.price = 50
        @video.valid?
        expect(@video.errors.full_messages).to include('Price is invalid. Price is out of setting range')
      end
      it 'priceは9,999,999より大きいと保存できない' do
        @video.price = 19_970_331
        @video.valid?
        expect(@video.errors.full_messages).to include('Price is invalid. Price is out of setting range')
      end
      it 'priceは半角数値でないと保存できない' do
        @video.price = '３３１'
        @video.valid?
        expect(@video.errors.full_messages).to include('Price is invalid. Price is out of setting range')
      end
      it 'priceは整数でないと保存できない' do
        @video.price = '1997.331'
        @video.valid?
        expect(@video.errors.full_messages).to include('Price is invalid. Price is out of setting range')
      end
      it 'userが紐づいていないと保存できない' do
        @video.user = nil
        @video.valid?
        expect(@video.errors.full_messages).to include('User must exist')
      end
    end
  end
end
