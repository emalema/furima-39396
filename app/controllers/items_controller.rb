class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_item, only: %i[edit update show destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
    redirect_to root_path and return if @item.user_id != current_user.id
    return unless @item.order.present?

    redirect_to root_path and return
  end

  def update
    if @item.user_id == current_user.id && @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :image,
      :price,
      :description,
      :category_id,
      :item_condition_id,
      :shipping_fee_id,
      :prefecture_id,
      :shipping_date_id
    ).merge(user_id: current_user.id)
  end
end
