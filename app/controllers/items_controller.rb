class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @brand = Brand.new
    @category1 = Category.new
    @category1s = Category.order("id").limit(13)
    @brands = Brand.all.order("id")
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      @item = Item.new(item_params)
    elsif @brand.brand_name.present?
      b_id = Brand.find_by(brand_name: @brand.brand_name).id
      @item = Item.new(item_params)
      @item["brand_id"] = b_id
    else
      @item = Item.new(item_params)
    end
    @item.save
    redirect_to new_item_path, notice: "出品しました"
  end
  
  private
  def brand_params
    params.require(:brand).permit(:brand_name)
  end
  def item_params
    params.require(:item).permit(:item_name,:brand_name,:category_id,:explanation,:price,:condition,:sent_charge,:shipping_area,:days_to_ship).merge(user_id: current_user.id, brand_id: @brand.id)
  end
end