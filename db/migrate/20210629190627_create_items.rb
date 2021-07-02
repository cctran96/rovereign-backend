class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.json :effect

      t.timestamps
    end
  end
end
