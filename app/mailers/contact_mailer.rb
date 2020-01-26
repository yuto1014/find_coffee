class ContactMailer < ApplicationMailer
	default from: 'from@example.com'

	def send_when_admin_reply(user, contact) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    @answer = contact.reply #返信内容
    mail to: user.email, subject: '【Find Your Best Coffee】 お問い合わせありがとうございます'
  end
end
