class RegistrationMailer < ActionMailer::Base
  default from: ApplicationHelper::HoodSenseFromEmail

  def confirmation_email(registrant)
    @registrant = registrant
    @url = "#{confirm_registrant_url(@registrant)}?code=#{@registrant.confirmation_code}"
    mail(to: @registrant.email, subject: 'HoodSense: Knock, Knock!')
    @registrant.sent = true
    @registrant.save
  end
end
