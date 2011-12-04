class ProfilesController < ApplicationController

  def index
    last_connection = Connection.order("created_at DESC").find(:first)
    random_ids = 10.times.map{ 1 + rand(last_connection.id) }    
    @connections = Connection.where(:id => random_ids)
  end
end
