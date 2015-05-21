class UserMailer < ActionMailer::Base
  default from: "bhicks@lighthousehrgroup.com"

  def mandrill_client
    @mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
  end
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
  
  def assignment_notification(user, assignment)
    @user = user
    @assignment = assignment
    
    template_name = "new-assignment"
    template_content = []
    message = {
        to: [{email: user.email}],
        subject: "New Assignment: #{assignment.employee_profile.name}",
        merge_vars: [
          {rcpt: user.email,
          vars: [ 
            {name: "EMPLOYEE", content: assignment.employee_profile.name}
            ]
          }
        ]
    }
    
    
    mandrill_client.messages.send_template template_name, template_content, message
    
    
    
    

    # mail(
    #   to: "#{user.email}",
    #   subject: "[IncluStaff] #{assignment.employee_profile.name} was assigned to #{assignment.job_order.company_profile.name}"
    #   )
  end
  
end