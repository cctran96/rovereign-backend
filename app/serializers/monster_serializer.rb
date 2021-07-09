class MonsterSerializer < ActiveModel::Serializer
  attributes :id, :name, :base_stats, :level_range, :base_exp, :base_gold, :map, :drops

  def map
    object.map.name
  end

  def drops
    object.drops.map{|drop| {amount: drop.amount, item: ItemSerializer.new(drop.item)}}
  end
end
