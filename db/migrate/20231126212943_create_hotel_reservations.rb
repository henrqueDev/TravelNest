class CreateHotelReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_reservations do |t|

      t.float :total_price, :null => false
      t.date :check_in, :null => false
      t.date :check_out, :null => false

      t.references :room, foreign_key: true
      t.references :user, foreign_key: true

    end
  end
end
