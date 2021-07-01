class Inventory < ApplicationRecord
  belongs_to :user_character
  has_many :inventory_items
  has_many :items, through: :inventory_items
end
