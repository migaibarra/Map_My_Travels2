class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :state_province
      t.string :country, null: false

      t.timestamps null: false
    end
  end
end
