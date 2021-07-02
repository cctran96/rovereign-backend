class UserCharacterSerializer < ActiveModel::Serializer
    attributes :id, :name, :gold, :level, :experience, :stats
    belongs_to :user
    has_one :inventory
  end