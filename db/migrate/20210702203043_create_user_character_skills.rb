class CreateUserCharacterSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :user_character_skills do |t|
      t.references :user_character, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
