class AddOnetableRefToThreetables < ActiveRecord::Migration[7.0]
  def change
    add_reference :threetables, :onetable, null: false, foreign_key: true
  end
end
