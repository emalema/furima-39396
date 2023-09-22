class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
  end
end

private

def item_params
  params.require(:item).permit(:name, :image).merge(user_id: current_user.id)
end
