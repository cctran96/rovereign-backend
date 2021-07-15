class UserCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :gold, :level, :experience, :stats, :inventory, :role
  
  def inventory
    object.inventory_items.sort_by{|i| i.item.cost}.map{|i| {id: i.id, amount: i.amount, item: i.item.name}}
  end

  def role
    Character.select("role").find(object.character.id).role
  end
end