class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name_city
      t.string :name_state
      t.string :name_country
      t.string :positionX
      t.string :positionY
      t.references :hotel, null: false, foreign_key: true
      
    end
  end
end
