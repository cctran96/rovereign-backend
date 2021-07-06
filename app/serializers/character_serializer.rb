class CharacterSerializer < ActiveModel::Serializer
    attributes :id, :role, :base_stats
  end
  