class Monster < ApplicationRecord
  belongs_to :map
  has_many :drops
  has_many :items, through: :drops
  serialize :base_stats
end
