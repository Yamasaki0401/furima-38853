require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @comment = FactoryBot.build(:comment, user_id: @user.id, item_id: @item.id)
    sleep 0.2
  end

  describe 'コメント機能' do
    context 'コメントが保存できる場合' do
      it 'textへの入力があれば保存できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが保存できない場合' do
      it 'textが空だと保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Text can't be blank"
      end

      it 'ログインしていなければtextが保存できない' do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'User must exist'
      end

      it 'item_idが紐づいていないとコメントが保存できない' do
        @comment.item_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Item must exist'
      end
    end
  end
end
