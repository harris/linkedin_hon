class ScoresController < ApplicationController
  def create    
    connection = Connection.find_by_linkedin_id(params[:linkedin_id])
    connection.rated_by(session[:user_id], params[:score].to_i)
    render :nothing => true
  end
end
