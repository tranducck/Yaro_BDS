class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.expired_date = Time.now.to_date + Settings.trial_days.day
    if @user.valid?
      @user.save
      log_in @user
      flash[:success] = "Welcome to BDS Yaro"
      redirect_to new_user_info_path
    else
      render "new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone, :status)
    end
end
