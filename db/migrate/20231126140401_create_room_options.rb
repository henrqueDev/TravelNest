class CreateRoomOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :room_options do |t|
      t.string :title

      t.integer :max_people
      t.integer :rooms_quantity
      t.float :price_per_day
      t.float :price_per_Person
      t.float :price_per_PersonChild

      t.boolean :free_wifi
      t.boolean :is_children_free

      t.belongs_to :hotel, foreign_key: true
    end
  end
end
