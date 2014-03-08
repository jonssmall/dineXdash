class MenuItemsController < ApplicationController
  #before_action :set_menu_item, only: [:show, :edit, :update, :destroy]
  before_filter :load_restaurant
  before_filter :ensure_owner, except: [:show, :index]
  #render "menu_items/show"

  def index
    @menu_items = @restaurant.menu_items.all
  end

  def show
    @menu_item=@restaurant.menu_items.find(params[:id])
  end

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
      else
        format.html { render action: 'new' }  
      end
    end
  end

  def update
    @menu_item=@restaurant.menu_items.find(params[:id])
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to [@restaurant, @menu_item], notice: 'Menu item was successfully updated.' }
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
    # def set_menu_item
    #   @menu_item = MenuItem.find(params[:id])
    # end

    def menu_item_params
      params.require(:menu_item).permit(:restaurant_id, :item_name, :item_desc, :price)
    end

    def load_restaurant
      @restaurant=Restaurant.find(params[:restaurant_id])
    end

    def ensure_owner
      unless current_user.id == @restaurant.owner.id
        redirect_to restaurant_path(@restaurant), alert: "Only the owner/POS can add or remove menu items to this restaurant!"
      end
    end

end
