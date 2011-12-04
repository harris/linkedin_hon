class ConnectionsController < ApplicationController
  def index
    render :text => $client.connections.all.length
  end

end