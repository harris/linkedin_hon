class AddUserData < ActiveRecord::Migration
  def up
    create_table :users, :force => true do |t|
      t.string :token
      t.string :secret
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end