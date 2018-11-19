Clearance.configure do |config|
  config.allow_sign_up = ENV['ALLOW_SIGNUP']
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
end
