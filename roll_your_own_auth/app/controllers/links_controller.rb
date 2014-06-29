class LinksController < ApplicationController
  
  before_action :check_if_logged_in
  
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def new
    @link = Link.new
    @comment = Comment.new
  end
  
  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end
  
  def edit

  end
  
  def update
    if @link && @link.update(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @link.delete if @link
  end
  
  def show
    
  end
  
  def index
    @links = Link.all
  end

  private
  
  def link_params
    params.require(:link).permit(:title, :url)
  end

  def set_link
    @link = Link.find(params[:id])
  end
  
  def check_if_logged_in
    redirect_to new_session_url unless logged_in?
  end


end
