class CreatePixKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :pix_keys do |t|
      t.string :key
      t.references :hotel, foreign_key: true
    end
  end
end
