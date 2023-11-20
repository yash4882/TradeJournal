class OrderMailer < ApplicationMailer

  default from: 'Yash <tradelog@gmail.com>'

  def received(order)
    @order = order
    mail to: order.email, subject: 'Tradelog Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped
    @order = order
    mail to: order.email, subject: 'Tradelog Store Order Shipped'
  end
end
