class AddActivityToBrewery < ActiveRecord::Migration
  def change
    add_column :breweries, :active, :boolean

    Brewery.update_all :active => true
  end
end
