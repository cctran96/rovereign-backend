class UserCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :gold, :level, :experience, :stats, :inventory, :role, :skills
  
  def inventory
    object.inventory_items.map{|i| {id: i.id, amount: i.amount, item: i.item.name}}
  end

  def role
    Character.select("role").find(object.character.id).role
  end

  def skills
    object.skills.map{|s| s.name}
  end
end