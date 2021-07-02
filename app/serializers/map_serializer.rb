class MapSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :monsters
end
