class CustomerEmailsController < ApplicationController
  before_action :user_must_logged_in

  def new
    @email_template = EmailTemplate.all
    @customers = current_user.customers
  end

  def create
    customer_email = CustomerEmail.new email_params
    customer_email.status = "publish"
    if customer_email.valid?
      customer_email.save
      render json: {
        error: "Success",
        data: customer_email
      }, status: 200
    else
      render json: {
        error: "Something error",
        data: nil
      }, status: 422
    end
  end

  private
    def email_params
      params.require(:email).permit(:user_id, :customer_id,
                                   :email_template_id, :content)
    end
end
