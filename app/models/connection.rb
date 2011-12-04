class Connection < ActiveRecord::Base 
  has_one :user
  validates_uniqueness_of :linkedin_id  
  has_many :scores
  
  def rated_by(user_id, score = 5)
    self.scores.create!(:user_id => user_id, :score => score)
    self.increment(:total_score, score)
    self.increment!(:num_scores, 1)    
  end
end