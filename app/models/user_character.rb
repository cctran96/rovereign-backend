class UserCharacter < ApplicationRecord
  belongs_to :user
  belongs_to :character
  has_many :user_character_skills
  has_many :skills, through: :user_character_skills
  has_one :inventory
  serialize :stats
end
