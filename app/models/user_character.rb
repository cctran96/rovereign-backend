class UserCharacter < ApplicationRecord
  belongs_to :user
  belongs_to :character
  has_one :inventory, dependent: :destroy
  has_many :skills, through: :user_character_skills
  has_many :inventory_items, through: :inventory
  serialize :stats

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5}
end
