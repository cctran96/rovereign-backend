class MonsterSerializer < ActiveModel::Serializer
  attributes :id, :name, :base_stats, :level_range, :base_exp, :base_gold
  belongs_to :map
end
