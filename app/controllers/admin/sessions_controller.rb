class Admin::SessionsController < ApplicationController
  layout "admin"

  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      admin_log_in admin
      redirect_to admin_root_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    admin_log_out if admin_logged_in?
    redirect_to admin_login_path
  end
end
