class Api::V1::CharactersController < ApplicationController

    skip_before_action :authorized, only: :index

    def index
        render json: {characters: Character.all.map{|c| CharacterSerializer.new(c)}}, status: :accepted
    end
end
