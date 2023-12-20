class CreatePixKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :pix_keys do |t|
      t.string :key
      t.references :hotel, foreign_key: true

      t.index :key, unique: true
    end
  end
end
