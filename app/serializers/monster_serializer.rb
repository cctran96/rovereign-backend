class MonsterSerializer < ActiveModel::Serializer
  attributes :id, :name, :base_stats, :base_exp, :base_gold, :map, :drops

  def map
    object.map.name
  end

  def drops
    object.drops.map{|drop| {amount: drop.amount, item: drop.item.name}}
  end
end
