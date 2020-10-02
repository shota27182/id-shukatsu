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
    @avatar_file = avatar_file_name(user)

    # set attachment file
    attachments[@avatar_file] =
      File.read(Rails.root.join("public#{avatar_url(@user)}"))
    mail( from: 'info@id-shukatsu.com',
          to: user.email,
          subject: '[ID就活]オフラインGD練習会中止のお知らせ',
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
