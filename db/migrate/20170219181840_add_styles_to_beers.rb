class AddStylesToBeers < ActiveRecord::Migration
  def change
    #Create table for styles
    create_table :styles do |s|
      s.string :name
      s.text :description

      s.timestamps
    end

    #F'd up database, just running db:create db:migrate and db:seed now to fix things
    #Below was my try on migrate script. It happened to be I didn't even have styles
    #in beer table for some reason. All was manually added without style I guess.

    #Add existing styles from beers-table
    #execute <<-SQL
    #  INSERT INTO styles (name, beer_id)
    #    SELECT style, id FROM beers;
    #SQL

    #Rename old style column in beers table
    #rename_column :beers, :style, :old_style

    #Add reference column to style from beer
    #add_foreign_key :beers, :style

    #Add style to new column according to old_style
    #execute <<-SQL
    #  UPDATE beers
    #  SET style_id = 1
    #  WHERE 1=1;
    #SQL

    #Remove old_style from beers
    #remove_column :beers, :old_style
  end
end
