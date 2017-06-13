class SessionsController < ApplicationController
  before_action :logged_in, only: :new

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_url(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

    def logged_in
      if current_user
        redirect_to admin_url(current_user)
      end
    end
end
