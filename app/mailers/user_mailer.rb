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
  
  def event_confirmation(user)
    @user = user

    mail( from: 'info@id-shukatsu.com',
          to: user.email,
          subject: '[ID就活]さあ、短時間で就活の一歩を踏み出そう 〜完全初心者向け、就活ロードマップ〜',
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
