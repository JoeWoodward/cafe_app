class UserMailer < ActionMailer::Base
  # Simple User mailer to send a token to reset a users password
  default from: "from@example.com"
  def reset_password_email user
    @user = user
    @url  = "http://0.0.0.0:3000/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end
end
