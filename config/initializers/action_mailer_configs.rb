MAILSERVER_FILE = File.join(RAILS_ROOT, '..', '..', 'shared', 'config', 'mailserverpassword') %>

ActionMailer::Base.smtp_settings = {
  :address => 'mail.opensprints.com',
  :port => 587,
  :domain => 'opensprints.com',
  :authentication => :login,
  :user_name => 'system@opensprints.com',
  :password => (File.read(MAILSERVER_FILE).chomp if File.readable?(MAILSERVER_FILE))
}

