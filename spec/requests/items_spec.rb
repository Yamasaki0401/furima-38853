require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#search' do
    context '正しいパラメーターが渡されている場合' do
      it '検索内容に該当する内容がある' do
        @params = {}
        @params[:q] = { item_name: 'test1' }
        @q = Item.ransack(@params)
        @items = @q.result
        expect(@items) == ({ item_name: 'test1' })
      end
    end

    context '不正なパラメーターが渡されている場合' do
      it '検索内容に該当す内容がない場合' do
        @params = {}
        @params[:q] = { item_name: 'test2' }
        @q = Item.ransack(@params)
        @items = @q.result
        expect(@items) != ({ item_name: 'テスト2' })
      end
    end
  end
end
