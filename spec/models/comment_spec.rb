require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント情報の保存' do
    context 'コメント情報の保存ができる場合' do
      it '全ての値だ正しく入力されてされていれば保存できる' do
        expect(@comment).to be_valid
      end

      it 'valueが空でも保存できる' do
        @comment.value = ''
        expect(@comment).to be_valid
      end
    end

    context 'コメント情報の保存ができない場合' do
      it 'textが空では保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it 'userが紐づいていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end

      it 'profileが紐づいていないと保存できない' do
        @comment.profile = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Profile must exist')
      end

      it 'videoが紐づいていないと保存できない' do
        @comment.video = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Video must exist')
      end
    end
  end
end
