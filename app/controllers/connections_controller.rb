class ConnectionsController < ApplicationController
  def index
    @connections = client.connections.all.select {|item| !item.pictureUrl.nil?}
  end
end
