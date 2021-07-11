class CreateMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :monsters do |t|
      t.text :name
      t.json :base_stats
      t.integer :base_exp
      t.integer :base_gold
      t.references :map, null: false, foreign_key: true

      t.timestamps
    end
  end
end
