# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def user
    user = User.new(name: "雪景色 トナカイ", email: "tonakai@example.com")
   
    UserMailer.creation_email(user)
  end

  # http://localhost:3000/rails/mailers/user_mailer
  # にアクセスするとプレビュー表示
end
