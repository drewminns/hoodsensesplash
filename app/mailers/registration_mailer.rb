class RegistrationMailer < ActionMailer::Base
  default from: ApplicationHelper::HoodSenseFromEmail

  def confirmation_email(registrant)
    @registrant = registrant
    @url =
  end
end
