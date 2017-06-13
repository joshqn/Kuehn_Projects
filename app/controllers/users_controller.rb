class UsersController < ApplicationController
  before_action :logged_in_user

  def show
    @user = User.find(params[:id])
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  private

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Admin Only"
        redirect_to root_url
      end
    end

end
