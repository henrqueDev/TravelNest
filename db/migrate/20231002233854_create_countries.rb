class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.index :name, unique: true
    end
  end
end
