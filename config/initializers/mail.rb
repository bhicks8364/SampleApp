MANDRILL_API_KEY = "al7ylUFcRMLJBhkV3f9T6A"
ActionMailer::Base.smtp_settings = {
    address: "smtp.mandrillapp.com",
    port: 587,
    enable_starttls_auto: true,
    user_name: "bhicks@lighthousehrgroup.com",
    password: MANDRILL_API_KEY,
    authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"

