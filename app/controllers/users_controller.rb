class UsersController < ApplicationController
  before_action :logged_in_user

  def show
  end

  def new
  end

  private

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Admin Only"
        redirect_to root_url
      end
    end

end
