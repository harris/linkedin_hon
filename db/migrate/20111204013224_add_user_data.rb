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
      t.string :small_url
      t.string :big_url
      t.integer :linkedin_id
      t.timestamps
    end    
  end

  def down
    drop_table :users
    drop_table :connections
  end
end