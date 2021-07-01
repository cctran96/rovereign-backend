class DropSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :monster
  has_one :item
end
