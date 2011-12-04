class Connection < ActiveRecord::Base 
  has_one :user
  validates_uniqueness_of :linkedin_id
end