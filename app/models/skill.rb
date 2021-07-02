class Skill < ApplicationRecord
    has_many :user_character_skills
    has_many :user_characters, through: :user_character_skills
    belongs_to :character
end
