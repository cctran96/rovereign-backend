class Api::V1::UserCharactersController < ApplicationController
    def create
        character = Character.find_by(role: params[:role])
        stats = character.base_stats
        stats[:current_hp] = stats[:hp]
        stats[:current_mp] = stats[:mp]
        data = user_character_params.clone
        data[:character] = character
        data[:stats] = stats
        user_character = UserCharacter.new(data)
        if user_character.save
            inv = Inventory.create(user_character: user_character)
            Item.first(5).each{|i| InventoryItem.create(item: i, inventory: inv, amount: 5)}
            skill = Skill.all.select{|s| s.character.role == params[:role]}.first
            UserCharacterSkill.create(user_character: user_character, skill: skill)
            render json: {character: UserCharacterSerializer.new(user_character)}, status: :accepted
        else
            render json: {errors: user_character.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        user_character = UserCharacter.find(params[:id])
        user_character.destroy
        render json: {character: user_character}, status: :accepted
    end

    def user_character_params
        params.permit(:user_id, :name, :gold, :level, :experience)
    end
end
