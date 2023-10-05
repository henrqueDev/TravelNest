class CreateHotelLocations < ActiveRecord::Migration[7.0]
  def change 
    create_table :hotel_locations do |t|
      t.string :positionX
      t.string :positionY
      t.string :CEP
      t.string :nameStreet
      t.integer :number
      t.references :hotel, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
    end
  end
end
