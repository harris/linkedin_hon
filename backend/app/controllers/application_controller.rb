class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :login_required
  
  def login_required
    if session[:atoken].nil? || session[:asecret].nil?
      redirect_to session_path
    end
  end
  
end
