class CreateUserTypes < ActiveRecord::Migration[7.0]
    def change
      create_table :user_types do |t|
        t.string :name
        t.references :state, null: false, foreign_key: true
      end
    end
  end
  