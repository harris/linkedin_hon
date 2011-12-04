class ScoresController < ApplicationController
  def create    
    current_user.rate(params[:linkedin_id], params[:score].to_i)
    render :nothing => true
  end
end
