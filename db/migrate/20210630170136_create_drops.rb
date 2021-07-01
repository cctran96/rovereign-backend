class CreateDrops < ActiveRecord::Migration[6.1]
  def change
    create_table :drops do |t|
      t.references :monster, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
