class CustomersController < ApplicationController
  before_action :user_must_logged_in

  def index
    @customers = current_user.customers
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new customer_params
    if @customer.valid?
      @customer.save
      flash[:success] = "Create customer successfully"
      redirect_to customers_path
    else
      render "new"
    end
  end

  def update
  end
end
