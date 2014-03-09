class CheckItemsController < ApplicationController
  before_filter :load_check
  before_filter :closed_check, only: [:create, :destroy]
  before_filter :ensure_pos, except: [:index, :show]
  # before_action :admin_user, only: [:index, :show]

  def create
      @menu_item = MenuItem.find(params[:menu_item][:id])
      @check_item = @check.check_items.new
      @check_item.quantity = params[:check_item][:quantity].to_i
      @check_item.price = @menu_item.price
      @check_item.item_name = @menu_item.item_name
      @check_item.item_desc = @menu_item.item_desc
      @check_item.check_id = @check.id

      respond_to do |format|
        if @check_item.save
          format.html { redirect_to check_path(@check), notice: 'Check item was successfully created.' }
          format.js {}
        else
          format.html { render 'checks/show' }   
          format.js {}
        end
      end
  end

  def update
    @check_item=@check.check_items.find(params[:id])
    respond_to do |format|
      if @check_item.update(check_item_params)
        format.html { redirect_to [@check, @check_item], notice: 'Check item was successfully updated.' }
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    @check_item = CheckItem.find(params[:id])
    @check_item.destroy
    respond_to do |format|
      format.html { redirect_to check_path(@check) }
    end
  end

  private
    def check_item_params
      params.require(:check_item).permit(:quantity, :item_name, :item_desc, :price)
    end

    def load_check
      @check=Check.find(params[:check_id])
    end

    def closed_check
      if @check.paid_at
        redirect_to check_path(@check), alert: "You can't change items on an old receipt."
      end
    end

    def ensure_pos
      unless current_user.id == @check.restaurant.owner.id
        redirect_to check_path(@check), alert: "Only the owner/POS can add or remove items on this check!"
      end
    end
end
