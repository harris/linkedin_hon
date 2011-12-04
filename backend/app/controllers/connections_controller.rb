class ConnectionsController < ApplicationController
  def index
    all_names =  $client.connections.all.map do |connection| 
      "#{connection.first_name} #{connection.last_name}"
    end
    render :text => all_names.join(",")
  end
  

end