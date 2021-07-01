class CreateUserCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :user_characters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.text :name
      t.integer :gold
      t.integer :level
      t.integer :experience
      t.json :stats

      t.timestamps
    end
  end
end
