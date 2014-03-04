class CheckItemsController < ApplicationController
  before_action :set_check_item, only: [:show, :edit, :update, :destroy]

  # GET /check_items
  # GET /check_items.json
  def index
    @check_items = CheckItem.all
  end

  # GET /check_items/1
  # GET /check_items/1.json
  def show
  end

  # GET /check_items/new
  def new
    @check_item = CheckItem.new
  end

  # GET /check_items/1/edit
  def edit
  end

  # POST /check_items
  # POST /check_items.json
  def create
    @check_item = CheckItem.new(check_item_params)

    respond_to do |format|
      if @check_item.save
        format.html { redirect_to @check_item, notice: 'Check item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @check_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @check_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_items/1
  # PATCH/PUT /check_items/1.json
  def update
    respond_to do |format|
      if @check_item.update(check_item_params)
        format.html { redirect_to @check_item, notice: 'Check item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @check_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_items/1
  # DELETE /check_items/1.json
  def destroy
    @check_item.destroy
    respond_to do |format|
      format.html { redirect_to check_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_item
      @check_item = CheckItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_item_params
      params.require(:check_item).permit(:restaurant_id, :item_name, :item_desc, :price)
    end
end
