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
    #mail(to: @email, from: @user, subject: @letter.subject)
    
  end
  
  def reach_out_email_secondary(letter, user)
    @email = letter.email2
    @letter = letter
    @user = user
    
    #mail(to: @email, from: @user, subject: @letter.subject)
  end

  def confirmation(letter, user)
    
    @letter = letter
    
    @user = user
    
    #mail(to: @user, from: "blazeTeam@blaze305.com", subject: "You did it !!!!!")
  end
  
end
