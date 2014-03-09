class MenuItemsController < ApplicationController
  before_filter :load_restaurant
  before_filter :ensure_owner_or_admin

  # def index
  #   @menu_items = @restaurant.menu_items.all
  # end

  # def show
  #   @menu_item=@restaurant.menu_items.find(params[:id])
  # end

  def new
    @menu_item = @restaurant.menu_items.new
  end

  def edit
    @menu_item = @restaurant.menu_items.find(params[:id])
  end

  def create
    @menu_item = @restaurant.menu_items.new(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Menu item was successfully created.' }
        format.js {}
      else
        format.html { render action: 'new' }  
        format.js {}
      end
    end
  end

  def update
    @menu_item=@restaurant.menu_items.find(params[:id])
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Menu item was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_path(@restaurant) }
    end 
  end

  private
    def menu_item_params
      params.require(:menu_item).permit(:restaurant_id, :item_name, :item_desc, :price)
    end

    def load_restaurant
      @restaurant=Restaurant.find(params[:restaurant_id])
    end

    def ensure_owner_or_admin
      unless current_user.admin? || current_user.id == @restaurant.owner.id 
        redirect_to :back, alert: "Only the owner/POS can make changes to this restaurant!"
      end
    end

end
