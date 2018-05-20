class CustomerMailer < ApplicationMailer
  def send_project
    customer = params[:customer]
    @customer_email = params[:customer_email]
    email_from = params[:from]
    mail(to: customer.email, subject: @customer_email.title, from: email_from)
  end
end
