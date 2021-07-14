class InventoryItemSerializer < ActiveModel::Serializer
    attributes :id, :amount, :item

    def item
        object.item.name
    end
end