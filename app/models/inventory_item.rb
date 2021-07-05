class InventoryItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :item

  validates :inventory, :item, presence: true
end
