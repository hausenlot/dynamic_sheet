class AddOnetableRefToTwotables < ActiveRecord::Migration[7.0]
  def change
    add_reference :twotables, :onetable, null: false, foreign_key: true
  end
end
