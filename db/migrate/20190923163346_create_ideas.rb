class CreateIdeas < ActiveRecord::Migration[6.0]
  def up
    create_table :ideas do |t|
      t.integer "user_id"
      t.text :title
      t.text :body
      t.timestamps
    end
    add_index("ideas", "user_id")
  end

  def down
    drop_table :users
  end
  
end

