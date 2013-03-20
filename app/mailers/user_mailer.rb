class UserMailer < ActionMailer::Base
  default from: "info@localis.com"

  def inform_planner_of(request)
    @request = request

    mail(to:      ENV['MAIL_TO'],
      #  cc:      ENV['MAIL_CC'],
         subject: "[Localis]Request a Plan from #{@request.username}"
         )
  end
end
