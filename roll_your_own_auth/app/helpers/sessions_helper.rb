module SessionsHelper
  
  def current_user
    token = session[:session_token]
    return nil unless token
    @current_user ||= User.find_by(session_token: token)
  end

  def current_user=(user)
    user.update(session_token: User.generate_session_token)
    session[:session_token] = user.session_token
    @current_user = user
  end
  
  def login!(user)
    self.current_user = user
  end
  
  def logout!
    current_user.session_token = nil
    @current_user = nil
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end
end
