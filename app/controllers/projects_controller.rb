class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :new, :show, :edit]
  attr_accessor :type

  # GET /projects
  # GET /projects.json
  def index
    @type = '2'
    params[:type] = @type
    @projects = Project.paginate(page: params[:page], :per_page => 3).order('id DESC')
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @user = User.find('1')
    @projects = Project.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render admin_url(current_user) }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to admin_url }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to admin_url }
      format.json { head :no_content }
    end
  end

  # GET /:type
  def type
    @projects = (params[:type] == '1' ? Project.ios_projects : Project.web_projects ).paginate(page: params[:page], :per_page => 3)
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :projType, :projImage, :projImage_file_name)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Admin Only"
        redirect_to root_url
      end
    end
end
