class UserMailer < ApplicationMailer
  
  default from: 'defaultfrom@usermailer.com'
  
  def welcome_email(user)
    @sub = user
    @url = 'http://example.com/login'
    mail(to: @sub.email, subject: "Welcome to FloridaToker")
  end
  
  def reach_out_email(letter, user)
    @email = letter.email1
    @letter = letter
    @user = user
    #mail(to: "amsterdamAL@gmail.com", from: "yourmomma@att.com", cc: @raffomail, subject: @letter.subject)
    
  end
  
  def reach_out_email_secondary(letter, user)
    @email = letter.email1
    @letter = letter
    @user = user
    
    #mail(to: "amsterdamAL@gmail.com", from: "from@hehe.com", cc: @raffomail, subject: @letter.subject)
    
  end
  
end
