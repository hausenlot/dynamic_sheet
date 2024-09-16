class CreateTwotables < ActiveRecord::Migration[7.0]
  def change
    create_table :twotables do |t|
      t.string :street_address 
      t.integer :building_number 
      t.string :city
      t.string :country
      t.integer :zip
      t.timestamps
    end
  end
end
