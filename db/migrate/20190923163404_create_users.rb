class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email", :default => '', :null => false
      t.string "password_digest", :limit => 40
      t.timestamps
    end
  end


  
  def down
    drop_table :users
  end
end
