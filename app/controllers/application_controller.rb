class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include AdminSessionsHelper

  private
    # Confirms a logged-in user.
    def user_must_logged_in
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def user_must_has_profile
      unless current_user.brands[0]
        flash[:danger] = "You must update your profile first"
        redirect_to new_user_info_path
      end
    end

    def admin_must_logged_in
      unless admin_logged_in?
        flash[:danger] = "Please log in."
        redirect_to admin_login_url
      end
    end
end
