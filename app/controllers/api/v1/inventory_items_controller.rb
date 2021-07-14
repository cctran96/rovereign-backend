class Api::V1::InventoryItemsController < ApplicationController
    def create
        begin
            character = UserCharacter.find(params[:id])
            inv = character.inventory
            hash = params[:items]
            hash.keys.each do |i|
                item = Item.find_by(name: i)
                exists = InventoryItem.find_by(item: item, inventory: inv)
                inventory_item = InventoryItem.find_or_initialize_by(item: item, inventory: inv).update(amount: exists ? hash[i] + exists.amount : hash[i])
            end
            inventory = character.inventory_items.map{|i| InventoryItemSerializer.new(i)}
            render json: {inventory: inventory}, status: :accepted
        rescue ActiveRecord::RecordInvalid => invalid
            render json: {errors: invalid.record.errors}, status: :unprocessable_entity
        end
    end

    def destroy

    end
end
