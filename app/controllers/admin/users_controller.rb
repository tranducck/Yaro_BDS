class Admin::UsersController < ApplicationController
  before_action :admin_must_logged_in
  layout "admin"

  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      date_expired = user.expired_date
      extension_days = params[:days].to_i
      if user.update(status: "active", expired_date: date_expired + extension_days.to_i.day)
        render json: {
          error: "Update successfully",
          data: {
            user: user
          }
        }, status: 200
      else
        render json: {
          error: "Something error",
          data: {
            user: nil
          }
        }, status: 422
      end
    else
      render json: {
        error: "User not found",
        data: {
          user: nil
        }
      }, status: 404
    end
  end
end
