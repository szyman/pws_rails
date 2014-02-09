class NoticeMailer < ActionMailer::Base
  default from: 'pwjs123@gmail.com'

  def notice_email
     emails = Notification.pluck(:email)
     mail(:to => emails, :subject => 'Kursy walut - NBP')
  end

end
