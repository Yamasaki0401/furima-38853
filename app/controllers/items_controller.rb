class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @q = Item.ransack(params[:q])
    @items = @q.result.order(created_at: :desc)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :description, :condition_id, :category_id,
                                 :shipping_fee_id, :shipping_schedule_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if current_user == @item.user && @item.order.blank?

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
