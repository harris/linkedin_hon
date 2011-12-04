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
      t.integer :total_score, :default => 0
      t.integer :num_scores, :default => 0     
      t.timestamps
    end    

    create_table :scores, :force => true do |t|
      t.integer :user_id
      t.integer :connection_id
      t.integer :score
      t.timestamps
    end

    create_table :delayed_jobs, :force => true do |table|
      table.integer  :priority, :default => 0      # jobs can jump to the front of
      table.integer  :attempts, :default => 0      # retries, but still fail eventually
      table.text     :handler                      # YAML object dump
      table.text     :last_error                   # last failure
      table.datetime :run_at                       # schedule for later
      table.datetime :locked_at                    # set when client working this job
      table.datetime :failed_at                    # set when all retries have failed
      table.text     :locked_by                    # who is working on this object
      table.timestamps
    end

  end

  def down
    drop_table :users
    drop_table :connections
    drop_table :scores
    drop_table :delayed_jobs
  end
end