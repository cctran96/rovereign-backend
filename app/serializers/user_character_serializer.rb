class UserCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :gold, :level, :experience, :stats, :inventory, :role
  belongs_to :user
  
  def inventory
    object.inventory_items.map{|i| InventoryItemSerializer.new(i)}
  end

  def role
    Character.select("role").find(object.character.id).role
  end
end