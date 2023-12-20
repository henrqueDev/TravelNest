class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :name
      t.index :name, unique: true
      t.references :country, null: false, foreign_key: true
    end
  end
end
