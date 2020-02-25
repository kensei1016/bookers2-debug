class UserMailer < ApplicationMailer
  default from: 'bookers@example.com'

  def creation_email(user)
    @user = user
    mail(
      subject: 'ユーザー登録完了メール',
      to: @user.email,
      from: 'bookers@example.com'
    )
  end
end
