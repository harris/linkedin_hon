class AddUserData < ActiveRecord::Migration
  def up
    create_table :users, :force => true do |t|
      t.string :token
      t.string :secret
      t.integer :linkedin_id
      t.integer :connection_id
      t.timestamps
    end
    
    create_table :connections, :force => true do |t|
      t.string :title
      t.string :first_name
      t.string :last_name      
      t.string :picture_url
      t.string :industry
      t.string :location
      t.string :country
      t.integer :linkedin_id
      t.integer :total_score
      t.integer :num_scores      
      t.timestamps
    end    
    
    create_table :scores, :force => true do |t|
      t.integer :user_id
      t.integer :connection_id
      t.integer :score
      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :connections
    drop_table :scores
  end
end