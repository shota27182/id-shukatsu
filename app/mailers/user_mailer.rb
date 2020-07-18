class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  default from: 'info@id-shukatsu.com'
  
  
  def account_activation(user)
    @user = user

    mail to: user.email, subject: "Account activations"
    
    mail( from: '"送信者名" <info@独自ドメイン.com>',
          to: @user.email,
          subject: 'お問い合わせありがとうございます。',
          bcc: 'shota27182@gmai.com',
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
