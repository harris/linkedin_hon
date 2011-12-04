class User < ActiveRecord::Base 
  belongs_to :connection
  after_create :mark_as_created
  after_commit :import_connections, :if => :persisted?  
  validates_uniqueness_of :linkedin_id
  
  def mark_as_created
    @created = true
  end
  
  def persisted?
    @created
  end
  
  def import_connections(client)
    connection = Connection.find_or_create_by_linkedin_id(self.linkedin_id)
    connection.update_attributes!(:first_name => client.profile.first_name, :last_name => client.profile.last_name)
    client.connections.all[0..50].each do |connection|  
      begin 
          uri = URI(connection.site_standard_profile_request.url)    
          linkedin_id = /&key=(\d+)/.match(uri.query)[1]
          unless Connection.exists?(:linkedin_id => linkedin_id)
            Connection.create!(:first_name => connection.first_name,
                               :last_name => connection.last_name,
                               :linkedin_id => linkedin_id,
                               :picture_url => connection.picture_url,
                               :location => connection.location.name,
                               :country => connection.location.country.code)        
          end
      rescue Exception => e        
      end
    end    
  end
    
end