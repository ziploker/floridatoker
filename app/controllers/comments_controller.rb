class CommentsController < ApplicationController
  
  def create
    
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create!(comment_params)
    redirect_to article_path(@article)
    #respond_to do |format|
    #  if @comment.save
        
        
    #    format.js {render 'okk'}
    #  else
    #    format.js { render 'ok' }
    #  end
    #end
    
    
  end
  

 def destroy
    
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
    
    
  end
  
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :picurl, :parent_id, :root_id, :root2_id, :root3_id, :level_id)
      
    end 
  
end
