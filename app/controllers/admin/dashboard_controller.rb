class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :admin_must_logged_in

  def index
  end
end
