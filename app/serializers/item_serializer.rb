class ItemSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :effect, :cost
end