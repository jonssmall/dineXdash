class CheckItemsController < ApplicationController
  # before_action :set_check_item, only: [:show, :edit, :update, :destroy]
  before_filter :load_check
  before_filter :pending_check, only: [:create]


  # def index
  #   @check_items = @check.check_items.all
  # end

  # def show
  # end

  # def new
  #   @check_item = @check.check_items.new
  # end

  # def edit
  #   @check_item = @check.check_items.find(params[:id])
  # end

  def create
    if @check.paid_at
      redirect_to check_path(@check), alert: "You can't add new items to old receipts!"
    else
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
        else
          format.html { render 'checks/show' }   
        end
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
    @check_item.destroy
    respond_to do |format|
      format.html { redirect_to check_check_items_path(@check) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_check_item
    #   @check_item = CheckItem.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_item_params
      params.require(:check_item).permit(:quantity, :item_name, :item_desc, :price)
    end

    def load_check
      @check=Check.find(params[:check_id])
    end

    def pending_check
      if @check.paid_at
        flash[:alert] = "You can't add items to an old receipt."
      end
    end



end
