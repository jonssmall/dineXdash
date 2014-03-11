class ChecksController < ApplicationController
  before_action :set_check, only: [:pay, :show, :edit, :update, :destroy]
  before_action :one_pending_check, only: [:create]
  # before_action :ensure_single_check, only: [:new, :create]
  before_filter :ensure_current_diner_or_owner_or_admin, only: [:show]
  before_filter :admin_user, only: [:index]

  def index
    @checks = Check.all
  end

  def pay
    binding.pry
    if current_user.id != @check.diner.id
      redirect_to check_path(@check), alert: "You can't pay for a bill that isn't yours!"
    else 
      @check.paid_at = DateTime.now.utc
      @check.tip = params[:check][:tip]
      @check.save
      
      @check.diner.checked_in = false
      @check.diner.save
      redirect_to check_path(@check), notice: "Payment confirmed."
    end

  end

  def show
    @check_item = @check.check_items.new
  end

  def new
    @check = Check.new
  end

  # GET /checks/1/edit
  def edit
  end

  def create

    @check = Check.new( :restaurant_id => params[:restaurant_id] )
    @check.diner = current_user
    @check.tip = @check.diner.tip


    respond_to do |format|
      if @check.save
        @check.diner.checked_in = true
        @check.diner.save!
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
      params.require(:check).permit(:user_id, :restaurant_id, :paid_at, :tip)
    end

    def one_pending_check
      if current_user.checks.pending.any?
        flash[:alert] = "You can't be in two places at once... yet."
        redirect_to(:back)
      end
    end

    def ensure_current_diner_or_owner_or_admin
      unless current_user.admin? || current_user.id == @check.restaurant.owner.id || current_user.id == @check.diner.id
        redirect_to root_url, alert: "You can't view another user's checks!"
      end
    end

end
