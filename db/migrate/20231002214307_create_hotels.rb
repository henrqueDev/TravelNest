class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :establishment_description
      t.string :cnpj
      t.boolean :auto_choose_room
      t.references :hotel_type, null: false, foreign_key: true
    end
  end
end
