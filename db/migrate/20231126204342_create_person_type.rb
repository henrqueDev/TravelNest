class CreatePersonType < ActiveRecord::Migration[7.0]
  def change
    create_table :person_types do |t|
      t.string :description, null: false
    end
  end
end
