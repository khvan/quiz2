class ChangePasswordDigestUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column "users", "password_digest"
    add_column "users", "password_digest", :string
  end

  def down
    remove_column "users", "password_digest"
    add_column "users", "password_digest", :limit => 40
  end

end

