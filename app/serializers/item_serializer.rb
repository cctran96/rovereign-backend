class ItemSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :effect
    has_many :inventory_items
end