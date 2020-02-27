class DailyMailer < ApplicationMailer
  default from: 'bookers@example.com'

  def creation_email
    # @users = User.all
    # @users.each do |user|
    @user = User.find(18)
      mail(
        subject: 'デイリーメール',
        to: @user.email,
        from: 'bookers@example.com'
      )
    # end
  end
end
