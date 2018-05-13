class CustomersController < ApplicationController
  before_action :user_must_logged_in
  before_action :user_must_has_profile, only: [:new, :create]

  def index
    @customers = current_user.customers.paginate(page: params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new customer_params
    @customer.user_id = current_user.id
    if current_brand = current_user.brands[0]
      @customer.brand_id = current_brand.id
    end
    if @customer.valid?
      @customer.save
      flash[:success] = "Create customer successfully"
      redirect_to customers_path
    else
      render "new"
    end
  end

  def edit
    @customer = Customer.find params[:id]
  end

  def update
    @customer = Customer.find params[:id]
    if @customer.update customer_params
      flash[:success] = "Update customer successfully"
      redirect_to edit_customer_path(@customer)
    else
      render "edit"
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :dob, :relation, :gender,
                                      :email, :phone)
    end
end
