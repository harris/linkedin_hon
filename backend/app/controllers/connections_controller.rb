class ConnectionsController < ApplicationController
  def index
    @connections = $client.connections.all.select {|item| !item.pictureUrl.nil?}

    # @all_names =  $client.connections.all.map do |connection| 
    #  "#{connection.first_name} #{connection.last_name}"
    #end
    # render :text => @all_names.join(",")
    # render :connections
  end
end
