class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_credentials(user_params)
    if @user && @user.update(user_params)
      login!(@user)
      redirect_to links_url
    else
      @user = User.new(user_params)
      flash.now[:errors] = ["Username and/or password are incorrect!"]
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    logout!
    redirect_to new_session_url
  end
  
  def show
    
  end
  
  def index
    
  end


  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end


end
