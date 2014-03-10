class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  def new
  	@user=User.new
  end

  def create
    respond_to do |format|
    	if @user = login(params[:email], params[:password])
        format.html {redirect_back_or_to(:root, notice: 'Login successful')}
        # format.js {}
      else
        # flash.now[:alert] = "Login failed"
        format.html{ render action: "new", alert: 'Login failed' }
        # format.js {}
      end
    end
  end

  def destroy
  	logout
    redirect_to(:root, notice: 'Logged out!')
  end
end
