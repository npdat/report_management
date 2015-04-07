class EmailsController < ApplicationController
  def sendMail
    mail_from = User.find(session[:user_id]).email
    mail_to = User.find(params[:mail_to]).email
    subject = params[:subject]
    message = params[:message]
    if UserMailer.send_mail(mail_from, mail_to, subject, message)
      redirect_to reports_url + "/" + params[:report_id]
    end
  end
end


