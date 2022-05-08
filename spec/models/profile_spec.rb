require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール登録' do
    context 'プロフィール登録できる場合' do
      it 'image、nickname、sex、genre、prefecture、birthday、biographyが存在すれば登録できる' do
        expect(@profile).to be_valid
      end

      it 'sexが空でも保存できる' do
        @profile.sex_id = 1
        expect(@profile).to be_valid
      end

      it 'genreが空でも保存できる' do
        @profile.genre_id = 1
        expect(@profile).to be_valid
      end

      it 'prefectureが空でも保存できる' do
        @profile.prefecture_id = 1
        expect(@profile).to be_valid
      end

      it 'birthdayが空でも保存できる' do
        @profile.birthday = ''
        expect(@profile).to be_valid
      end

      it 'biographyが空でも保存できる' do
        @profile.biography = ''
        expect(@profile).to be_valid
      end
    end

    context 'プロフィール登録できない場合' do
      it 'imageが空では保存できない' do
        @profile.image = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Image can't be blank")
      end

      it 'nicknameが空では登録できない' do
        @profile.nickname = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Nickname can't be blank")
      end
    end
  end
end
