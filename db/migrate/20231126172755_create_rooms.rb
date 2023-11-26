class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer room_floor, null: false
      
      t.references :room_options, foreign_key: true
    end
  end
end
