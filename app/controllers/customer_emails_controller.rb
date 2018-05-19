class CustomerEmailsController < ApplicationController
  before_action :user_must_logged_in

  def new
    @customer_email = CustomerEmail.new
  end

  def create
  end
end
