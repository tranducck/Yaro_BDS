class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Đăng nhập thành công"
      redirect_back_or user
    else
      flash.now[:danger] = "Thông tin đăng nhập sai"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
