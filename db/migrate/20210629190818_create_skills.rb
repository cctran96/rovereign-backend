class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.text :name
      t.text :description
      t.json :effect
      t.integer :level
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
