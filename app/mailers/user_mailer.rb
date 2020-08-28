class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  default from: 'info@id-shukatsu.com'
  
  
  def account_activation(user)
    @user = user

    mail( from: 'info@id-shukatsu.com',
          to: user.email,
          subject: '[ID就活]新規登録確認メール',
          reply_to: 'info@id-shukatsu.com' )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user =user
    mail to: user.email, subject: "Password reset"
  end
end
