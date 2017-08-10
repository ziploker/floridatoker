class LettersController < ApplicationController
  
  before_action :authenticate_user!, :except => [:show, :index]
  
    
  def create
    @letter = Letter.new(letter_params)
    @user = current_user.email
    if @letter.save
      UserMailer.reach_out_email(@letter, @user).deliver_now
      UserMailer.reach_out_email_secondary(@letter, @user).deliver_now
      redirect_to @letter
    end
    
  end
  
  def review
    @letter = Letter.new()
    @email = ENV['email']
    @email2 = ENV['email2']
    @raffomail = ENV['email3']
    @district = params[:district_1]
    #@email = params[:email_to_controller]
    @name = params[:name_to_controller]
    @district2 = params[:district_2]
    #@email2 = params[:email2_to_controller]
    @name2 = params[:name2_to_controller]
    
    if user_signed_in?
      
      @user = current_user.email
    end
    @subject = "Urgent issue regarding marijuana use"  
    @body = "In light of the mounting evidence of marijuana’s medical efficacy, I urge you to support giving seriously ill patients in our state legal access to marijuana with a doctor’s recommendation.

The evidence in favor of marijuana’s health benefits is hard to ignore. The National Academy of Sciences Institute of Medicine issued a report in 1999, finding that marijuana had important health benefits. According to the IOM, for patients with AIDS or cancer patients undergoing chemotherapy and suffering from severe pain, nausea, and appetite loss, cannabinoid drugs might offer broad-spectrum relief not found in any other single medication.

In February 2010, the University of California’s Center for Medical Cannabis Research presented the results of several of their studies conducted over the course of the past decade to the California Legislature. These studies showed once again that marijuana has therapeutic effects in cases where other treatments have failed or been ineffective.

Twenty-three states and Washington, D.C. now have laws to protect patients who benefit from the medical use of marijuana. But seriously ill patients in our state are still depending on lawmakers like you to help them, and this is a case where evidence and compassion are on the same side. I hope the scientific evidence will convince you to introduce or support a medical marijuana bill in the near future."
    
    
  end
  
  private
  def letter_params
    params.require(:letter).permit(:subject, :body, :name, :name1, :name2, :address, :city, :zip, :email1, :email2, :ip)
  end
  
  
end
