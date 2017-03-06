class AddOauthUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauth_user, :boolean
  end
end
