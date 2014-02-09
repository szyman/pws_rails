  ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => "plain",
    :user_name => "pwjs123@gmail.com",
    :password => "marekszymanski",
    :enable_starttls_auto => true
  }
