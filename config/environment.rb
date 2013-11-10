# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
    :user_name => ENV['SENDGRID_USER'],
    :password => ENV['SENDGRID_PASSWORD'],
    :domain => 'www.hoodsense.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

# Initialize the Rails application.
Hoodsensesplash::Application.initialize!
