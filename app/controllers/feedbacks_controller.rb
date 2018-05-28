class FeedbacksController < ApplicationController
  
  def new
    @feedback = Feedback.new    
  end
  
  def create
   
  @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        FeedbackMailer.feedback_email(@feedback).deliver_now
        #format.html { render 'now', notice: 'User was successfully created.' }
        format.js {render 'success'}
      else
        format.js { render 'errors' }
      end
    end
  end      
  
  
  private
  def feedback_params
    params.require(:feedback).permit(:name, :email, :body)
  end
  
end
