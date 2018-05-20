class ProjectsController < ApplicationController
  layout false

  def show
    @project = Project.find_by(id: params[:project_id])
    @brand = Brand.find_by(id: params[:brand_id])
  end
end
