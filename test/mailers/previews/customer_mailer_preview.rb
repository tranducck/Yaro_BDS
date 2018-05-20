# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview
  def send_project
    customer = Customer.first
    customer_email = CustomerEmail.first
    from = "yaro@asds.com"
    CustomerMailer.with(
      customer: customer,
      customer_email: customer_email,
      from: from
    ).send_project
  end
end
