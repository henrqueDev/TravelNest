class CreateHotelTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_types do |t|
      t.string :name
    end
  end
end
