class Api::V1::UserCharactersController < ApplicationController
    def destroy
        user_character = UserCharacter.find(params[:id])
        user_character.destroy
        render json: {character: user_character}, status: :accepted
    end
end
