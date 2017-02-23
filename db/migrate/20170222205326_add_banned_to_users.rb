class AddBannedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :banned, :boolean
    User.reset_column_information
    User.update_all :banned => false
  end
end
