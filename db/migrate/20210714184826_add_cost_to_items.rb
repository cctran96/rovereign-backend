class AddCostToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :cost, :integer
  end
end
