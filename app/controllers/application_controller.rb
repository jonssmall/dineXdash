class ApplicationController < ActionController::Base
  # layout "orbit"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

	private
	def not_authenticated
  		redirect_to login_path, alert: "Please login first"
	end

  # def ensure_single_check
  #   unless current_user.checked_in_restaurants.count < 1
  #     flash[:alert] = "You can't be in two places at once... yet."
  #     redirect_to root_path
  #   end
  # end

  def admin_user
    unless current_user.admin?
      redirect_to(:back, alert: 'You must be an admin to do that!')
    end
  end
  
end

