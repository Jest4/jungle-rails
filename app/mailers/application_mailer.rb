class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def order_receipt(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'YOUR RECEIPT')
  end

end
