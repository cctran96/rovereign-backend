class Item < ApplicationRecord
    has_many :inventory_items
    has_many :inventories, through: :inventory_items
    has_many :drops
    has_many :monsters, through: :drops
end
