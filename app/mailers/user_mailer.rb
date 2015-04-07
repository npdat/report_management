class UserMailer < ActionMailer::Base
  #default from: "from@example.com"
  def send_mail(mail_from, mail_to, mail_subject, mail_body)

    # setup smtp configuration
    ActionMailer::Base.raise_delivery_errors = true
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.perform_deliveries = true


    ActionMailer::Base.smtp_settings = {
        :address => "smtp.tma.com.vn",
        :port => '25',
        :domain => "tma.com.vn",
        :enable_starttls_auto => 0,
        :openssl_verify_mode => 'none'
    }

    mail(from: mail_from,
         to: mail_to,
         subject: mail_subject,
         body: mail_body).deliver!

    puts 'Send mail successfully.'
    return true

  end
end
