class CreateOnetables < ActiveRecord::Migration[7.0]
  def change
    create_table :onetables do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :prefix
      t.string :suffix
      t.timestamps
    end
  end
end
