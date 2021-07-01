class CreateInventoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_items do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
