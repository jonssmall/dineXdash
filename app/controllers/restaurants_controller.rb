class RestaurantsController < ApplicationController
  #need to do before_action :require_login, except:
  # before_action :ensure_owner, only
  before_action :require_login, except: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :ensure_owner_or_admin, only: [:update, :edit, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant=Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant= Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner_id = current_user.id

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @restaurant=Restaurant.find(params[:id])
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @restaurant= Restaurant.find(params[:id])
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url }
    end
  end

  private
  #Should we have a set_restaurant_owner here?
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :description, :owner_id)
    end

    def ensure_owner_or_admin
      unless current_user.admin? || current_user.id == @restaurant.owner.id
        redirect_to :back, alert: "Only the owner/POS can make changes to this restaurant!"
      end
    end

end
