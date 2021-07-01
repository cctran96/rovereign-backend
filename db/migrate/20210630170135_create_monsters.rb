class CreateMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :monsters do |t|
      t.text :name
      t.json :base_stats
      t.text :level_range
      t.text :base_exp
      t.text :base_gold
      t.references :map, null: false, foreign_key: true

      t.timestamps
    end
  end
end
