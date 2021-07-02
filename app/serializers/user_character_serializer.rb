class UserCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :gold, :level, :experience, :stats, :inventory
  belongs_to :user
  
  def inventory
    object.inventory_items.map{|i| InventoryItemSerializer.new(i)}
  end
end