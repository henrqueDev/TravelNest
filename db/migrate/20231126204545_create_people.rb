class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, null: false

      t.references :room, foreign_key: true
      t.references :person_type, foreign_key: true
      
    end
  end
end
