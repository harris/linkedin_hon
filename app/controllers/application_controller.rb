class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :login_required
  
  def login_required
    if session[:atoken].nil? || session[:asecret].nil?
      redirect_to session_path
    else 
      client.authorize_from_access(session[:atoken], session[:asecret])      
    end
  end
  
  def client 
    @client ||= LinkedIn::Client.new('921smhk051xk', '0r4kB7ouRfzBQhWm')    
  end
end
