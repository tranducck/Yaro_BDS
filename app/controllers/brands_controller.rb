class BrandsController < ApplicationController
  before_action :user_must_logged_in

  def edit
    @brand = Brand.find params[:id]
  end

  def update
    @brand = Brand.find params[:id]
    if @brand.update brand_params
      flash[:success] = "Update successfully"
      redirect_to root_path
    else
      render "edit"
    end
  end

  private
    def brand_params
      params.require(:brand).permit(:name, :hot_line, :logo, :info)
    end
end
