class CreateThreetables < ActiveRecord::Migration[7.0]
  def change
    create_table :threetables do |t|
      t.string :primary_school 
      t.string :secondary_school
      t.string :university 
      t.string :degree
      t.timestamps
    end
  end
end
