class DropSerializer < ActiveModel::Serializer
  attributes :id, :amount
  belongs_to :monster
  belongs_to :item
end
