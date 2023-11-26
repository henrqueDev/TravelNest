class CreateRoomOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :room_options do |t|
      t.string :title

      t.integer :max_people
      t.float :price_default, null: false
      t.float :price_per_Person, null: false
      t.float :price_per_PersonChild

      t.boolean :free_wifi, null: false
      t.boolean :is_children_free, null: false
      t.boolean :is_refundable, null: false

      t.references :hotel, foreign_key: true
    end
  end
end
