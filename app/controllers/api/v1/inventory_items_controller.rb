class Api::V1::InventoryItemsController < ApplicationController
    def create
        begin
            character = UserCharacter.find(params[:id])
            inv = character.inventory
            hash = params[:items]
            updatedItems = []
            hash.keys.each do |i|
                item = Item.find_by(name: i)
                exists = InventoryItem.find_by(item: item, inventory: inv)
                InventoryItem.find_or_initialize_by(item: item, inventory: inv).update(amount: exists ? hash[i] + exists.amount : hash[i])
                updatedItems << InventoryItemSerializer.new(InventoryItem.find_by(item: item, inventory: inv))
            end
            render json: {inventory: updatedItems}, status: :accepted
        rescue ActiveRecord::RecordInvalid => invalid
            render json: {errors: invalid.record.errors}, status: :unprocessable_entity
        end
    end

    def destroy

    end
end
