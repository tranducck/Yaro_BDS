class UsersController < ApplicationController
  before_action :user_must_logged_in, only: [:edit, :update]
  before_action :right_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.expired_date = Time.now.to_date + Settings.trial_days.day
    if @user.valid?
      @user.save
      log_in @user
      flash[:success] = "Đăng ký thành công"
      redirect_to new_user_info_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.authenticate(params[:user][:old_password])
      if @user.update change_password_params
        flash[:success] = "Đổi mật khẩu thành công"
        redirect_to root_path
      else
        render "edit"
      end
    else
      flash.now[:danger] = "Mật khẩu cũ không hợp lệ"
      render "edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone, :status)
    end

    def change_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def right_user
      @user = User.find_by(id: params[:id])
      unless @user == current_user
        flash[:danger] = "Đường dẫn không tồn tại"
        redirect_to root_path
      end
    end
end
