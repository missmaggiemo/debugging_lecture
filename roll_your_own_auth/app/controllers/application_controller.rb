class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include SessionsHelper
  
  helper_method :logged_in?, :current_user, :form_auth_html, :update_method_html
  
  def form_auth_html
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>".html_safe
  end
  
  def update_method_html
    "<input type='hidden' name='_method' value='patch'>".html_safe
  end
  
end
