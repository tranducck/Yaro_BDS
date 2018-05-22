class CustomerEmailsController < ApplicationController
  before_action :user_must_logged_in
  before_action :user_must_has_profile, only: [:new, :create]

  def index
    @emails = CustomerEmail.paginate(page: params[:page])
  end

  def new
    @email_template = EmailTemplate.all
    @customers = current_user.customers
    @projects = Project.all
  end

  def create
    customer_email = CustomerEmail.new email_params
    customer_email.status = "publish"
    if customer_email.valid?
      customer_email.save
      customer = customer_email.customer
      email_from = customer_email.user.email
      render json: {
        error: "Success",
        data: customer_email
      }, status: 200
      CustomerMailer.with(
        customer: customer, 
        customer_email: customer_email,
        from: email_from).send_project.deliver_now
    else
      render json: {
        error: "Something error",
        data: nil
      }, status: 422
    end
  end

  private
    def email_params
      params.require(:email).permit(:user_id, :customer_id, :title,
                                   :email_template_id, :content, :project_id)
    end
end
