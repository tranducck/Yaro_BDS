class UserInfosController < ApplicationController
  before_action :user_must_logged_in

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new brand_params
    @brand.user_id = current_user.id
    if @brand.valid?
      @brand.save
      flash[:success] = "Tao thong tin ca nhan thanh cong"
      redirect_to root_path
    else
      render "new"
    end
  end

  private
    def brand_params
      params.require(:brand).permit(:name, :hot_line, :logo, :info)
    end
end
