class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def order_receipt(order, user)
    @order, @user = order, user
    mail(to: @order.email, subject: 'YOUR RECEIPT')
  end

end
