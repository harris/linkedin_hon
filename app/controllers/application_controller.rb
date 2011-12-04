class ApplicationController < ActionController::Base
  helper_method :logged_in?
  
  def login_required
    if !logged_in?
      redirect_to session_path
    else 
      client.authorize_from_access(session[:atoken], session[:asecret])      
    end
  end
  
  def logged_in?
    !session[:user_id].nil?
  end
  
  def client 
    @client ||= LinkedIn::Client.new('921smhk051xk', '0r4kB7ouRfzBQhWm')    
  end
  
  
end

