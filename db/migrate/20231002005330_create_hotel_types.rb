class CreateHotelTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_types do |t|
      t.primary_key :id
      t.string :nome

      t.timestamps
    end
  end
end
