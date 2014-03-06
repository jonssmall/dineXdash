class ChecksController < ApplicationController
  before_action :set_check, only: [:show, :edit, :update, :destroy]
  # before_action :ensure_single_check, only: [:new, :create]
  def index
    @checks = Check.all
  end

  def show
  end

  def new
    @check = Check.new
  end

  # GET /checks/1/edit
  def edit
  end

  def create

    @check = Check.new( :restaurant_id => params[:restaurant_id] )
    @check.user = current_user


    respond_to do |format|
      if @check.save
        @check.user.checked_in = true
        @check.user.save!
        format.html { redirect_to @check, notice: "Check was successfully created." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @check.update(check_params)
        format.html { redirect_to @check, notice: 'Check was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @check.destroy
    respond_to do |format|
      format.html { redirect_to checks_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      @check = Check.find(params[:id])
    end

    def check_params
      params.require(:check).permit(:user_id, :restaurant_id, :paid_at)
    end

end
