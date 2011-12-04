class SessionsController < ApplicationController
  skip_before_filter :login_required
  
  def show
    request_token = $client.request_token(:oauth_callback => "http://#{request.host_with_port}/session/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret
    redirect_to $client.request_token.authorize_url
  end

  def callback
    if session[:atoken].nil?
      atoken, asecret = $client.authorize_from_request(session[:rtoken], session[:rsecret], params[:oauth_verifier])
      session[:atoken] = atoken
      session[:asecret] = asecret
    else
      $client.authorize_from_access(session[:atoken], session[:asecret])
    end
    @profile = $client.profile
    @connections = $client.connections
    render :text => @connections.all.length
  end

end