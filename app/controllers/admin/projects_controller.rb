class Admin::ProjectsController < ApplicationController
  before_action :admin_must_logged_in
  layout "admin"

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.valid?
      @project.save
      flash[:success] = "Create successfully"
      redirect_to admin_projects_path
    else
      render "new"
    end
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    if @project.update project_params
      flash[:success] = "Project was updated successfully"
      redirect_to edit_admin_project_path(@project)
    else
      render "edit"
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to admin_projects_path
  end

  private
    def project_params
      params.require(:project).permit(:name, :address, :investor,
                                      :constructor, :logo, :info)
    end
end
