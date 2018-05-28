class FeedbackMailer < ApplicationMailer
  
  default from: 'doNotReply@FloridaToker.com'
  
  def feedback_email(feedback)
    @feedback = feedback
    mail(to: "amsterdamAL@gmail.com", subject: "New Feedback has just been posted" )
    
    
  end
  
  
end
