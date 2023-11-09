class CreateHotelImages < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_images do |t|
      t.string :url
      t.references :hotel, null: false, foreign_key: true
    end
  end
end
