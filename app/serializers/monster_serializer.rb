class MonsterSerializer < ActiveModel::Serializer
  attributes :id, :name, :base_stats, :level_range, :base_exp, :base_gold
  has_many :drops
  belongs_to :map
end
