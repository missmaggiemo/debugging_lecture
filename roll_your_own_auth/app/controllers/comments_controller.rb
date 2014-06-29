class CommentsController < ApplicationController

  def new
    
  end
  
  def create
    params[:comment][:link_id] = params[:link_id]
    params[:comment][:user_id] = current_user.id
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to link_url(@comment.link)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to link_url(@comment.link)
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment
      @link = @comment.link
      @comment.delete if @comment
      redirect_to link_url(@link)
    end
  end
  
  def show
    
  end
  
  def index
    
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:link_id, :user_id, :body)
  end


end
