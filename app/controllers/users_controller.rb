class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

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

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end

end
