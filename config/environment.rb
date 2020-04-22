# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
 :address              => "test@kiprosh.com",
 :port                 =>  587,
 :domain               => "gmail.com",  
 :user_name            => "Test User",
 :password             => 'test123',
 :authentication       => "plain",
 :enable_starttls_auto => true
 }