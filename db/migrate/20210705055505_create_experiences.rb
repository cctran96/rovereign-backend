class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.integer :level
      t.integer :exp

      t.timestamps
    end
  end
end
