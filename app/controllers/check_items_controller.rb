class CheckItemsController < ApplicationController
  # before_action :set_check_item, only: [:show, :edit, :update, :destroy]
  before_filter :load_check

  def index
    @check_items = @check.check_items.all
  end

  def show
  end

  def new
    @check_item = @check.check_items.new
  end

  def edit
    @check_item = @check.check_items.find(params[:id])
  end

  def create
    @check_item = @check.check_items.new(check_item_params)

    respond_to do |format|
      if @check_item.save
        format.html { redirect_to check_check_items_path, notice: 'Check item was successfully created.' }
      else
        format.html { render action: 'new' }   
      end
    end
  end

  # PATCH/PUT /check_items/1
  # PATCH/PUT /check_items/1.json
  def update
    @check_item=@check.check_items.find(params[:id])
    respond_to do |format|
      if @check_item.update(check_item_params)
        format.html { redirect_to [@check, @check_item], notice: 'Check item was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /check_items/1
  # DELETE /check_items/1.json
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
      params.require(:check_item).permit(:restaurant_id, :item_name, :item_desc, :price)
    end

    def load_check
      @check=Check.find(params[:check_id])
    end
end
