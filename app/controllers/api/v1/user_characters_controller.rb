class Api::V1::UserCharactersController < ApplicationController

    before_action :set_user_character, only: [:update, :destroy]

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
            skill = Skill.all.select{|s| s.character.role == params[:role]}.first
            UserCharacterSkill.create(user_character: user_character, skill: skill)
            render json: {character: UserCharacterSerializer.new(user_character)}, status: :accepted
        else
            render json: {errors: user_character.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @char.update(user_character_params)
            hash = {}
            user_character_params.keys.each {|key| hash[key] = @char[key]}
            render json: {updates: hash}, status: :accepted
        else
            render json: {errors: @char.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @char.destroy
        render json: {character: @char}, status: :accepted
    end

    private
    
    def set_user_character
        @char = UserCharacter.find(params[:id])
    end

    def user_character_params
        params.permit(:user_id, :name, :gold, :level, :experience, stats: {})
    end
end
