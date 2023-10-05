class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :establishment_description
      t.string :cnpj
      t.float :evaluation
      t.references :hotel_type, null: false, foreign_key: true
    end
  end
end
